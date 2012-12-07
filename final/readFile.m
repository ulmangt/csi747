function [ A ] = readFile( name )
%readFile read a handwriting data file
    fid = fopen( name, 'r' );
    A = fscanf( fid, '%d', inf );
    A = reshape( A, [ 8*8, length(A)/(8*8) ] );
    fclose( fid );
end