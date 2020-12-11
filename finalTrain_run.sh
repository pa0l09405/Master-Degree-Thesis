## UNET

#FIRST EPOCH
#python train.py --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --netG unet_256 --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs 1 --n_epochs_decay 0 --lr 0.0002 --checkpoints_dir './checkpoints_normV2_resized_finalTrain_unet256_40epoche'
#OTHER 10 EPOCH : CONSTANT LR
#epochCount=2  
#for epochCount in {2..10}
#do
#   echo $epochCount
#   python train.py --continue_train --epoch_count $epochCount --netG unet_256 --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr 0.0002 --checkpoints_dir './checkpoints_normV2_resized_finalTrain_unet256_40epoche'
#   epochCount=$epochCount+1
#done
#OTHER 10 EPOCH : LR/2 at each epoch
#lr=$(echo "scale=14; (0.0002)/2.0" | bc);
#epochCount=11
#for epochCount in {11..20}
#do
#   echo $epochCount
#   python train.py --continue_train --epoch_count $epochCount --netG unet_256 --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr $lr --checkpoints_dir './checkpoints_normV2_resized_finalTrain_unet256_40epoche'
#   epochCount=$epochCount+1
#   lr=$(echo "scale=14; ($lr)/2.0" | bc);
#done
#OTHER 20 EPOCH : LR/2 at each epoch
#epochCount=21
#for epochCount in {21..40}
#do
#   echo $epochCount
#   python train.py --continue_train --epoch_count $epochCount --netG unet_256 --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr $lr --checkpoints_dir './checkpoints_normV2_resized_finalTrain_unet256_40epoche'
#   epochCount=$epochCount+1
#   lr=$(echo "scale=14; ($lr)/2.0" | bc);
#done

## RESNET

#FIRST EPOCH
python train.py --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs 1 --n_epochs_decay 0 --lr 0.0002 --checkpoints_dir './checkpoints_normV2_resized_finalTrain_resnet_20epoche'
#OTHER 10 EPOCH : CONSTANT LR
epochCount=2  
for epochCount in {2..10}
do
   echo $epochCount
   python train.py --continue_train --epoch_count $epochCount --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr 0.0002 --checkpoints_dir './checkpoints_normV2_resized_finalTrain_resnet_20epoche'
   epochCount=$epochCount+1
done
#OTHER 10 EPOCH : LR/10
lr=$(echo "scale=14; (0.0002)/10.0" | bc);
epochCount=11
for epochCount in {11..20}
do
   echo $epochCount
   python train.py --continue_train --epoch_count $epochCount --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized_train+val --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr $lr --checkpoints_dir './checkpoints_normV2_resized_finalTrain_resnet_20epoche'
   epochCount=$epochCount+1
done
  