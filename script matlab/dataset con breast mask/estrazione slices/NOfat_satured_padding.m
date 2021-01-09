contenuto_dir=dir;
tabella_dir = table([contenuto_dir.isdir].', {contenuto_dir.name}.', 'VariableNames', {'isdir', 'name'});
immagini_mat=tabella_dir.name(tabella_dir.isdir==0);
numero_slice=size(immagini_mat);
numero_slice=numero_slice(1);
immagini_mat=immagini_mat(2:numero_slice);
numero_slice=size(immagini_mat);
numero_slice=numero_slice(1);
path=['D:\Google Drive\TesiUNINA\Colab Notebooks\dataset\dce_mri_breast_cancer_noBreastMask\slice_estratte\NofatSatured\padded'];
mkdir(path);


zeroUp=zeros(152,256);
zeroDown=zeros(152,256);
zeroLeft=zeros(384,64);
zeroRight=zeros(384,64);
padded_image=zeros(384,384);

for j=1:numero_slice
   filename_mat=immagini_mat{j};
   image_mat=load(filename_mat);
   image=image_mat.slice; 
   padded_image=[zeroUp; image; zeroDown];
   padded_image=[zeroLeft padded_image zeroRight];
   filename=[path '\' filename_mat];
   save(filename,'padded_image');
   padded_image=zeros(384,384);
end

