#%90 confidence mean is Produces intervals that cover the true parameter 90% of the time. 

#1-) varyans:ne kadar yayıldıklarını gösterir farkların karesinin ortalaması
n <- 100 #öğrenci syaısı
mean_IQ <- 109 #ortalaması
var_IQ <- 225
sd_IQ <- sqrt(var_IQ)

x <- 30
p0 <- 0.35 #test edilecek oran

#1i-) hipotez testi Z-Test mutlak değer içinde 1.96 dan küçük olduğu sürece doğru kabul edilir
#SE=Standart Error,bunun outputuna bir daha bak
sample_p <- x/n
SE_p <- sqrt(p0 * (1-p0)/n) #standart hata
Z <- (sample_p - p0) / SE_p #Z testing
Z

#1ii-)prob.test başarı sayısı ilk=30,toplam deneme sayısı=100,yüzdeliği ifade ediyor
#Düzeltme yapma, klasik normal yaklaşımı kullan false kullandık ondan
prop.test(x = x, n = n, p = p0, correct = FALSE)#bunun outputuna bir daha bak

#1b-) %99 Güven Aralığı: IQ>115 oranı
#qnorm=Bu olasılığa karşılık gelen Z değeri kaç?

#1i-)%99 güven aralığı % olarak outoputta
z99 <- qnorm(0.995)
SE_hat <- sqrt(sample_p*(1-sample_p) / n)#answer:How variable is our estimate (p̂)?
#To quantify the uncertainty of the proportion estimate
CI99_norm <- c(sample_p - z99*SE_hat, sample_p + z99*SE_hat)#calculate the upper and lower
#hangi aralıkta oldupğunu bulmak için bu işlemi yapıyoruz üstteki
CI99_norm

#1ii-)prob.test %99 swviyesinde güven düzeyinde hesapla aralıkların %99gerçek parametreyi hesaplar
prop.test(x = x, n = n, conf.level = 0.99, correct = FALSE)

#1c-)ortalama IQ iç.in %90 güven aralığpı

SE_mean <- sd_IQ / sqrt(n) #Standard Error of the Mean
z90 <- qnorm(0.95) #%90 güven düzeyi için kritik z değerini buluyor
CI90 <- c(mean_IQ - z90*SE_mean, mean_IQ + z90*SE_mean)
#standart hata kadar bir pay eklenip çıkarılarak oluşturulur kaç SE gideyim
CI90

#1d-)aynı ortalama için bu sefer t-dağılımı kullanarak %90 güven aralığı kurmak.
#popülasyon bilinmiyor, s kullanılıyor ondan qt
#sample and the mean is calculated from the data,one degree of freedom is lost n-1
t90 <- qt(0.95, df = n-1)#t dağılımından dolayı bunu kullandık soruda diyor qt
CI90_t <- c(mean_IQ - t90*SE_mean,mean_IQ + t90*SE_mean)
CI90_t

#1e-)t-test daha temkinli
#Çünkü ekstra belirsizliği hesaba katar

# i) Z-test (sigma biliniyor varsayımıyla)

mu0 <- 115

z_stat <- (mean_IQ - mu0) / SE_mean
z_stat

p_value_z <- 2 * pnorm(-abs(z_stat))
p_value_z


t_stat <- (mean_IQ - mu0) / SE_mean # 109-115/1.5=-4 beklenenden 4 standart aşağıdadır
t_stat
#-abs(t_stat) the area in the left tail and *2 mean both of them right and left
p_value <- 2 * pt(-abs(t_stat), df = n-1) #pt=probabilities of T ≤ x 
p_value

#2-)
data <- read.csv("weight1.csv", header = TRUE, sep = ";")
names(data)
t.test(data$Height,mu=170)#170 den az çıktı mu popülasyon ortalaması

#3-)
t.test(data$Height, conf.level = 0.90)$conf.int#sondakinin amacı sadece alt ve üst sınırları çekmek

#4-)
female_data <- data$Height[data$Sex == "0"]#ortalama kadınalr 170 boyları
unique(data$Sex)#52 kadın var
t.test(female_data, mu = 160)#ortalama 6.4 standart hata daha büyük

#5-)%98 confidence interval
t.test(female_data, conf.level = 0.98)$conf.int

#6-)%25 i 180 den uzunmu kontrol etme sorusu
#not:tek bir oran(rate) kullanıldığı için df=1 dir
male_data <- data$Height[data$Sex == 1] #erkekleri seç
x <- sum(male_data > 180)#180 den uzun olanlar
n <- length(male_data)
x #1
n #47
x/n #[1] 0.0212766
#The sample size is big, so the normal method is good. Therefore, we did not use 
#the continuity correction.
prop.test(x = x, n = n, p = 0.25, correct = FALSE)#much lower than %25

#7-)180 cm’den uzun olanların oranı için %96 güven aralığı
male_data <- data$Height[data$Sex == 1]

x <- sum(male_data > 180)
n <- length(male_data)

prop.test(x = x, n = n, conf.level = 0.96, correct = FALSE)$conf.int
#Erkek öğrenciler arasında 180 cm’den uzun olanların gerçek oranı,
#%96 güven düzeyinde yaklaşık %0.4 ile %11.8 arasındadır.