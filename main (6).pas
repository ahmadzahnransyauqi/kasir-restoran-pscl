program PesanMenuRestoran;
uses crt;

var
    kode: string;
    i, total_harga, pajak: longint;
    jumlah_menu: array[1..8] of integer;
    harga_menu: array[1..8] of longint = (18000, 17000, 10000, 20000, 17000, 15000, 25000, 20000);
    nama_menu: array[1..8] of string = ('Kwetiaw Goreng Telur', 'Ayam Bakar Madu', 'Salad Buah', 
                                         'Nasi Goreng Spesial', 'Nasi dengan Ayam Pop', 
                                         'Soto Ayam', 'Ikan Bakar Kecap', 'Sate Ayam');

begin
    clrscr;
    
    total_harga := 0;
    for i := 1 to 8 do
        jumlah_menu[i] := 0; // Inisialisasi jumlah setiap menu dengan 0

    writeln('Menu Restoran:');
    for i := 1 to 8 do
        writeln(i, '. ', nama_menu[i], ' - ', harga_menu[i]);
        
    writeln('Masukkan kode menu yang ingin dipesan (contoh: 135 untuk menu 1, 3, dan 5): ');
    readln(kode);

    for i := 1 to length(kode) do
    begin
        if (kode[i] >= '1') and (kode[i] <= '8') then
        begin
            jumlah_menu[ord(kode[i]) - ord('0')] := jumlah_menu[ord(kode[i]) - ord('0')] + 1;
            total_harga := total_harga + harga_menu[ord(kode[i]) - ord('0')];
        end
        else
            writeln('Kode ', kode[i], ' tidak valid, diabaikan.');
    end;

    pajak := total_harga div 10;

    writeln('Anda memilih: ');
    for i := 1 to 8 do
        if jumlah_menu[i] > 0 then
            writeln(nama_menu[i], ' x', jumlah_menu[i]);

    writeln('Total harga sebelum pajak: ', total_harga);
    writeln('Pajak (10%): ', pajak);
    writeln('Total yang harus dibayar: ', total_harga + pajak);
    
    readln;
end.