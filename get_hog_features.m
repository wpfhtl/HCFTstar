function x = get_hog_features(im, config, cos_window)
%GET_FEATURES
%   Extracts dense features from image.

    cell_size=config.features.cell_size;
%     nwindow=config.features.window_size;
    nbins=config.features.nbins;
    if size(im,3)>1
        im = rgb2gray(im);
    end  
    %HOG features, from Piotr's Toolbox
    x = double(fhog(single(im) / 255, cell_size, nbins));
    x(:,:,end) = [];  %remove all-zeros channel ("truncation feature")

% %     % pixel intensity histogram, from Piotr's Toolbox
%     h1=histcImWin(im,nbins,ones(nwindow,nwindow),'same');        
%     h1=h1(cell_size:cell_size:end,cell_size:cell_size:end,:);
% 
%     % intensity ajusted hitorgram
% 
%     im= 255-calcIIF(im,[cell_size,cell_size],32);
%     h2=histcImWin(im,nbins,ones(nwindow,nwindow),'same');
%     h2=h2(cell_size:cell_size:end,cell_size:cell_size:end,:);
% 
%     x=cat(3,x,h1,h2);
%% color feature
%        w2c = config.w2c;
%         sz = size(x);
% 		im_patch = imresize(im, [sz(1) sz(2)]);
% 		out_npca = get_feature_map(im_patch, 'gray', w2c);
% 		out_pca = get_feature_map(im_patch, 'cn', w2c);
% % 		out_pca = reshape(temp_pca, [prod(sz), size(temp_pca, 3)]);
% 		x = cat(3,x,out_npca);
% 		x=cat(3,x,out_pca);
	%process with cosine window if needed
	if ~isempty(cos_window),
		x = bsxfun(@times, x, cos_window);
	end
	
end
