function PaddedSlices = NOfatSatured_padding(volume)
    
    PaddedSlices_temp={};
    zeroUp=zeros(88,256);
    zeroDown=zeros(88,256);
    padded_slice=zeros(256,256);
    
    size_volume=size(volume);
    numero_di_slice=size_volume(3);
    
    for i=1:numero_di_slice
       slice=volume(:,:,i);
       padded_slice=[zeroUp; slice; zeroDown];
       PaddedSlices_temp{end+1}=padded_slice; 
       padded_slice=zeros(256,256);
    end

    PaddedSlices=PaddedSlices_temp;
end

