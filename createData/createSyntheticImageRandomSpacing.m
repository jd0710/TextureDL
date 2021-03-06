%% Create a synthetic image by repeating the pattern texel numOfTexels 
%%times placed at random locations
function im = createSyntheticImageRandomSpacing( imageHeight ,imageWidth ,texel,numberOfTexels )
    [texelwidth,texelheight] = size(texel);
    im = ones(imageWidth,imageHeight);
    numberOfpointsAdded = 0;
    while(numberOfpointsAdded < numberOfTexels)
        x = randi(imageWidth);
        y = randi(imageHeight);

        %check if (x,y) is near boundary
        if(x - texelwidth/2  + 1 > 1 && x + texelwidth/2 < imageWidth && y - texelheight/2 + 1 > 1 && y + texelheight/2 <imageHeight)
            %check for overlapping texels
            window = im(x - texelwidth/2 + 1 :x + texelwidth/2,y - texelheight/2 + 1: y + texelheight/2 );
            
            if(min(min(window)) == 1  )
                im(x - texelwidth/2 + 1:x + texelwidth/2,y - texelheight/2 + 1: y + texelheight/2 ) = texel;
                numberOfpointsAdded = numberOfpointsAdded + 1;
            end
        end
    end

end

