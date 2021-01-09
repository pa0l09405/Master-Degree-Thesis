"""General-purpose test script for image-to-image translation.

Once you have trained your model with train.py, you can use this script to test the model.
It will load a saved model from '--checkpoints_dir' and save the results to '--results_dir'.

It first creates model and dataset given the option. It will hard-code some parameters.
It then runs inference for '--num_test' images and save results to an HTML file.

Example (You need to train models first or download pre-trained models from our website):
    Test a CycleGAN model (both sides):
        python test.py --dataroot ./datasets/maps --name maps_cyclegan --model cycle_gan

    Test a CycleGAN model (one side only):
        python test.py --dataroot datasets/horse2zebra/testA --name horse2zebra_pretrained --model test --no_dropout

    The option '--model test' is used for generating CycleGAN results only for one side.
    This option will automatically set '--dataset_mode single', which only loads the images from one set.
    On the contrary, using '--model cycle_gan' requires loading and generating results in both directions,
    which is sometimes unnecessary. The results will be saved at ./results/.
    Use '--results_dir <directory_path_to_save_result>' to specify the results directory.

    Test a pix2pix model:
        python test.py --dataroot ./datasets/facades --name facades_pix2pix --model pix2pix --direction BtoA

See options/base_options.py and options/test_options.py for more test options.
See training and test tips at: https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix/blob/master/docs/tips.md
See frequently asked questions at: https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix/blob/master/docs/qa.md
"""
import os
from options.test_options import TestOptions
from data import create_dataset
from models import create_model
from util.visualizer import save_images
from util import html
from util.visualizer import Visualizer
from data.unaligned_dataset import UnalignedDataset
import sys
import ntpath
import time

if __name__ == '__main__':
    valid_D_A_losses=[]
    valid_D_B_losses=[]
    opt = TestOptions().parse()  # get test options
    # hard-code some parameters for test
    opt.num_threads = 0   # test code only supports num_threads = 0
    opt.batch_size = 1    # test code only supports batch_size = 1
    opt.serial_batches = True  # disable data shuffling; comment this line if results on randomly chosen images are needed.
    opt.no_flip = True    # no flip; comment this line if results on flipped images are needed.
    opt.display_id = -1   # no visdom display; the test code saves the results to a HTML file.
    dataset = create_dataset(opt)  # create a dataset given opt.dataset_mode and other options
    dataset_size = len(dataset)
    model = create_model(opt)      # create a model given opt.model and other options
    model.setup(opt)               # regular setup: load and print networks; create schedulers
    # create a website
    web_dir = os.path.join(opt.results_dir, opt.name, '{}_{}'.format(opt.phase, opt.epoch))  # define the website directory
    if opt.load_iter > 0:  # load_iter is 0 by default
        web_dir = '{:s}_iter{:d}'.format(web_dir, opt.load_iter)
    print('creating web directory', web_dir)
    webpage = html.HTML(web_dir, 'Experiment = %s, Phase = %s, Epoch = %s' % (opt.name, opt.phase, opt.epoch))
    # create a logging file to store training losses
    log_name = os.path.join(opt.results_dir, opt.name, 'loss_log.txt')
    with open(log_name, "a") as log_file:
        now = time.strftime("%c")
        log_file.write('================ Test / Validation Loss (%s) ================\n' % now)
    # test with eval mode. This only affects layers like batchnorm and dropout.
    # For [pix2pix]: we use batchnorm and dropout in the original pix2pix. You can experiment it with and without eval() mode.
    # For [CycleGAN]: It should not affect CycleGAN as CycleGAN uses instancenorm without dropout.
    if opt.eval:
        model.eval()
    for i, data in enumerate(dataset):
        if i >= opt.num_test:  # only apply our model to opt.num_test images.
            break
        model.set_input(data)  # unpack data from data loader
		
        val_DA_loss, val_DB_loss = model.test()           # run inference and returns losses of the discriminators
        
        valid_D_A_losses.append(val_DA_loss.item())
        valid_D_B_losses.append(val_DB_loss.item())
        visuals = model.get_current_visuals()  # get image results
        img_path = model.get_image_paths()     # get image paths
        
        print('processing (%04d)-th image... %s' % (i, img_path))
        print('Valid losses : D_A = '+str(valid_D_A_losses[i])+'  , D_B = '+str(valid_D_B_losses[i]))
        save_images(webpage, visuals, img_path, aspect_ratio=opt.aspect_ratio, width=opt.display_winsize)
		
    webpage.save()  # save the HTML
	
    #print valid_Ds_losses on log file
    
	#compute average losses
	valid_DA_loss=(sum(valid_D_A_losses)*float(opt.batch_size))/float(dataset_size)
    valid_DB_loss=(sum(valid_D_B_losses)*float(opt.batch_size))/float(dataset_size)
    #print output on log
	message = 'Evaluation losses : '
    message += 'D_A_loss : %.3f ' % (valid_DA_loss)
    message += 'D_B_loss : %.3f ' % (valid_DB_loss)
	print(message)  # print the message
    with open(log_name, "a") as log_file:
        log_file.write('%s\n' % message)  # save the message
    message=[]
