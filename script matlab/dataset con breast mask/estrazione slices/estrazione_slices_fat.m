contenuto_dir=dir;
tabella_dir = table([contenuto_dir.isdir].', {contenuto_dir.name}.', 'VariableNames', {'isdir', 'name'});
nomi_volumi=tabella_dir.name(tabella_dir.isdir==0 & tabella_dir.name~="estrazione_dataset_fat_satured.m" & tabella_dir.name~="estrazione_dataset_fat_satured.asv" & tabella_dir.name~="fat_satured_cropping.m" & tabella_dir.name~="fatSatured_cropping.m" & tabella_dir.name~="solo_per_paziente_b20_fatSatured.m" & tabella_dir.name~="estrazione_dataset_fat_satured_con_cropping.m" & tabella_dir.name~="estrazione_dataset_fat_satured_con_cropping.asv");
numero_volumi=size(nomi_volumi);
numero_volumi=numero_volumi(1);
path=['D:\Google Drive\TesiUNINA\Colab Notebooks\dataset\dce_mri_breast_cancer\slice_estratte\norm_0_255\fatSatured'];
mkdir(path);
for j=1:numero_volumi
    filename_volume=nomi_volumi{j};
    id_paziente=extractBefore(filename_volume,"_")
    paziente = load(filename_volume);
    volume_paziente=paziente.volume;
    size_volume=size(volume_paziente);
    numero_di_slice=size_volume(3);
    
    for i=1:numero_di_slice
        slice=volume_paziente(:,:,i);
        pazient_dir_path=[path '\' id_paziente];
        if(~exist(pazient_dir_path,'dir'))
           mkdir(pazient_dir_path);
        end
        imwrite(uint8(slice),[pazient_dir_path filesep id_paziente '_' num2str(i) '.png' ]);
    end
end