function edgeDetector(input,kSize)

   if input:size(1) ~= 1 then print("Error. Input must be grayscale") end
   if type(kSize) == 'string' then kSize = tonumber(kSize) end

   if kSize == 3 then
      ker = torch.Tensor(3,3):fill(-1)
      ker[2][2] = 8
   end

   if kSize == 5 then
      ker = torch.Tensor(5,5):fill(-1)
      -- ker[3][3] = 24 -- all direction edges
      ker[{ {},3 }] = 4 -- just vertical edges
   end

   output = image.convolve(input,ker)

   return(output)
end