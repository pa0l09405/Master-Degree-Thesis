contenuto_dir=dir;
tabella_dir = table([contenuto_dir.isdir].', {contenuto_dir.name}.', 'VariableNames', {'isdir', 'name'});
nomi_volumi=tabella_dir.name(tabella_dir.isdir==0 & tabella_dir.name~="estrazione_dataset_NO_fat_satured.m" & tabella_dir.name~="estrazione_dataset_NO_fat_satured.asv" & tabella_dir.name~="NOfatSatured_padding.m" & tabella_dir.name~="NOfatSatured_padding.asv" & tabella_dir.name~="estrazione_dataset_NO_fat_satured_con_padding.m" & tabella_dir.name~="estrazione_dataset_NO_fat_satured_con_padding.asv");
numero_volumi=size(nomi_volumi);
numero_volumi=numero_volumi(1);
path=['D:\Google Drive\TesiUNINA\Colab Notebooks\dataset\dce_mri_breast_cancer_normV2\slice_estratte\NOfatSatured\'];
mkdir(path);

for j=1:numero_volumi
    filename_volume=nomi_volumi{j};
    id_paziente=extractBefore(filename_volume,"_")
    paziente = load(filename_volume);
    volume_paziente=paziente.volume;
    PaddedSlices = NOfat_satured_padding(volume_paziente);
    
    numero_di_slice=size(PaddedSlices,2);
    
    for i=1:numero_di_slice
        slice=PaddedSlices{i};
        pazient_dir_path=[path '\' id_paziente];
        if(~exist(pazient_dir_path,'dir'))
           mkdir(pazient_dir_path);
        end
        imwrite(uint8(slice),[pazient_dir_path filesep id_paziente '_' num2str(i) '.png' ]);
    end
end