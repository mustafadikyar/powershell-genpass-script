# powershell-genpass-script

Bu repository, kullanıcıların belirlediği parametrelere göre rastgele ve güçlü parolalar oluşturan bir PowerShell script'idir. Parolanın uzunluğu ve kullanılacak karakter türleri (küçük harf, büyük harf, rakamlar, özel karakterler) ayarlanabilir.

## Kullanım

Script'i kullanmak için şu adımları takip edebilirsiniz:

1. Repository'yi klonlayın veya `generate_password.ps1` script'ini indirin.
2. PowerShell'i açın ve script'in bulunduğu dizine gidin.
3. Aşağıdaki komutu kullanarak script'i istediğiniz parametrelerle çalıştırın:

```powershell
.\generate_password.ps1 -l <parola uzunluğu> -o <karakter türleri>
```  

### Kullanım Örnekleri 

- 12 karakter uzunluğunda, küçük harfler, rakamlar ve özel karakterler içeren bir parola oluşturmak için:

```powershell
.\generate_password.ps1 -l 12 -o lds
```
- 8 karakter uzunluğunda, sadece rakamlar ve özel karakterlerden oluşan bir parola oluşturmak için:  

```powershell
.\generate_password.ps1 -l 8 -o ds
```

### Yardım
- Kullanım hakkında yardıma ihtiyacınız olduğunda, aşağıdaki komutu çalıştırabilirsiniz:  

```powershell
.\generate_password.ps1 -help
```
