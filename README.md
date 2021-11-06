# Отчет

## Анализ пиков гистоновой метки H2AFZ

#### Гистограммы длинн участков до фильтрации
*Колличество пиков:*
ENCFF159YHL - 62939 пиков
ENCFF446ASD - 31150 пиков
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_asd.png)
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_yhl.png)

#### Гистограмма длинн после фильтрации
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_filt_asd.png)
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_filt_yhl.png)

пайчарт распределения

## Анализ Z-DNA

распределние длинн

пайчарты

## Анализ пересечений

гистограмма пересечений

скрины

## Список всех команд для командной строки

zcat ENCFF159YHL.bed.gz | cut -f1-5 > H2AFZ_bone_marrow_ENCFF159YHL_hg19.bed
zcat ENCFF446ASD.bed.gz | cut -f1-5 > H2AFZ_bone_marrow_ENCFF446ASD_hg19.bed

