#FIRST EPOCH
python train.py --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --netG unet_256 --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs 1 --n_epochs_decay 0 --lr 0.0002 --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256'
python test.py --phase valid --eval --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --netG unet_256 --input_nc 1 --output_nc 1 --name DCEMRI_cyclegan --model cycle_gan --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256' --no_flip --load_size 256 --display_winsize 384 --results_dir './results_normV2_resized__1_12_2020_unet256/'
#OTHER 10 EPOCH : CONSTANT LR
epochCount=2  
for epochCount in {2..10}
do
   echo $epochCount
   python train.py --continue_train --epoch_count $epochCount --netG unet_256 --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr 0.0002 --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256'
   python test.py --phase valid --eval --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --netG unet_256 --input_nc 1 --output_nc 1 --name DCEMRI_cyclegan --model cycle_gan --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256' --no_flip --load_size 256 --display_winsize 384 --results_dir './results_normV2_resized__1_12_2020_unet256/'
   epochCount=$epochCount+1
done
#OTHER 10 EPOCHS
lr=$(echo "scale=14; (0.0002)/2.0" | bc); #learning rate decay step
epochCount=11
for epochCount in {11..20}
do
   echo $epochCount
   python train.py --continue_train --epoch_count $epochCount --netG unet_256 --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr $lr --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256'
   python test.py --phase valid --eval --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --netG unet_256 --input_nc 1 --output_nc 1 --name DCEMRI_cyclegan --model cycle_gan --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256' --no_flip --load_size 256 --display_winsize 384 --results_dir './results_normV2_resized__1_12_2020_unet256/'
   epochCount=$epochCount+1
   lr=$(echo "scale=14; ($lr)/2.0" | bc); #learning rate decay step
done
#OTHER 20 EPOCHS
lr=$(echo "scale=14; (0.0002)/2.0" | bc); #learning rate decay step
epochCount=21
for epochCount in {21..40}
do
   echo $epochCount
   python train.py --continue_train --epoch_count $epochCount --netG unet_256 --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --save_epoch_freq 1 --batch_size 1 --name DCEMRI_cyclegan --load_size 256 --no_flip --display_id 0 --display_winsize 384 --model cycle_gan --input_nc 1 --output_nc 1 --n_epochs $epochCount --n_epochs_decay 0 --lr $lr --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256'
   python test.py --phase valid --eval --dataroot ./datasets/DCE_MRI_breastCancer_normV2_resized --netG unet_256 --input_nc 1 --output_nc 1 --name DCEMRI_cyclegan --model cycle_gan --checkpoints_dir './checkpoints_normV2_resized_1_12_2020_unet256' --no_flip --load_size 256 --display_winsize 384 --results_dir './results_normV2_resized__1_12_2020_unet256_21_to_40_epoch/'
   epochCount=$epochCount+1
   lr=$(echo "scale=14; ($lr)/2.0" | bc); #learning rate decay step
done
