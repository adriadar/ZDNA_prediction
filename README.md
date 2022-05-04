## Подготовка датасета и модель
Как видно из графика ниже (из первого дз) в моем наборе данных нет пересечений длины 1000, поэтому взяла последовательности длины 200.

[Ноутбук с подготовкой и обработкой данных](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/scr/hw2_data_preparation.ipynb)

Пример данных для обучения можно найти в файле [data_for_network](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/tree/main/data_for_network).

[Ноубук с моделью](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/scr/hw2_network.ipynb)

![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_intersect.png)

## Сбор данных и их обработка

[Сессия в genome browser](https://genome.ucsc.edu/s/adriadar/hse21_H2AFZ_ZDNA_human)

[ноутбук с кодом для почти всех заданий](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/scr/notebook.ipynb)

[ChIPpeakAnno.R](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/scr/ChIPpeakAnno.R)
### Анализ пиков гистоновой метки H2AFZ

#### Гистограммы длин участков до фильтрации
*Колличество пиков:*

ENCFF446ASD - 62939 пиков

ENCFF159YHL - 31150 пиков

![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_asd.png)
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_yhl.png)

#### Гистограмма длин после фильтрации
Порог фильтрации для каждого экперимента равен 1500

*Колличество пиков после фильтрации:*

ENCFF446ASD - 62860 пиков

ENCFF159YHL - 30739 пиков

![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_filt_asd.png)
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_len_filt_yhl.png)

#### Расположение пиков относительно аннотированных генов
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/asd_piechart.png)
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/yhl_piechart.png)

### Анализ Z-DNA
*Колличество пиков Z-DNA равно 19394*

#### Гистограмма длин
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/zdna_hist.png)

#### Расположение относительно аннотированных генов
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/zdna_piechart.png)
## Анализ пересечений

#### Гистограмма длин пересечений
*Колличество пиков пересечений Z-DNA и гистоновой метки равно 2656*
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/hist_intersect.png)

#### Скриншоты из genome.ucsc.edu

*Координаты: chr7:128694716-128695330*
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/chr7.png)

*Координаты: chr11:101980748-101981341*
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/chr11.png)

#### Go-анализ
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/go_res.png)
![](https://github.com/adriadar/hse21_H2AFZ_ZDNA_human/blob/main/images/go_analysis.png)

#### Список всех команд для командной строки
```
    zcat ENCFF159YHL.bed.gz | cut -f1-5 > H2AFZ_bone_marrow_ENCFF159YHL_hg19.bed
    zcat ENCFF446ASD.bed.gz | cut -f1-5 > H2AFZ_bone_marrow_ENCFF446ASD_hg19.bed

    cat  *_filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H2AFZ_bone_marrow_hg19_filtered_merged.bed

    Команды для genome browser:
    track visibility=dense name="ENCFF159YHL" description="H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed"
    https://raw.githubusercontent.com/adriadar/hse21_H2AFZ_ZDNA_human/main/data/H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed?token=AN743GR6LMAKGLDUFWIXBMTBQ3GEI
    track visibility=dense name="ENCFF446ASD" description="H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed"
    https://raw.githubusercontent.com/adriadar/hse21_H2AFZ_ZDNA_human/main/data/H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed?token=AN743GRJ7YHPBYQ6X5LYK43BQ3GIA
    track visibility=dense name="ChIP_merge" color=50,50,200 description="H2AFZ_bone_marrow_hg19_filtered_merged.bed"
    https://raw.githubusercontent.com/adriadar/hse21_H2AFZ_ZDNA_human/main/data/H2AFZ_bone_marrow_hg19_filtered_merged.bed?token=AN743GVV6Z23DB5U5HT2YULBQ3GK2
    
    Проверяем расположение относительно ассоциированных генов:
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed -b 3utr.bed -c > ENCFF159YHL_3utr.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed -b 5utr.bed -c > ENCFF159YHL_5utr.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed -b codingExons.bed -c > ENCFF159YHL_codingExons.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed -b exons.bed -c > ENCFF159YHL_exons.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed -b introns.bed -c > ENCFF159YHL_introns.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF159YHL_hg19_filtered.bed -b promoters.bed -c > ENCH2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bedFF159YHL_promoters.bed
    
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b 3utr -c > ENCFF446ASD_3utr.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b 3utr.bed -c > ENCFF446ASD_3utr.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b 5utr.bed -c > ENCFF446ASD_5utr.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b codingExons.bed -c > ENCFF446ASD_codingExons.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b exons.bed -c > ENCFF446ASD_exons.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b introns.bed -c > ENCFF446ASD_introns.bed
    bedtools intersect -a H2AFZ_bone_marrow_ENCFF446ASD_hg19_filtered.bed -b promoters.bed -c > ENCFF446ASD_promoters.bed
    
    bedtools intersect -a DeepZ.bed -b 3utr.bed -c > DeepZ_3utr.bed
    bedtools intersect -a DeepZ.bed -b 5utr.bed -c > DeepZ_5utr.bed
    bedtools intersect -a DeepZ.bed -b codingExons.bed -c > DeepZ_codingExons.bed
    bedtools intersect -a DeepZ.bed -b exons.bed -c > DeepZ_exons.bed
    bedtools intersect -a DeepZ.bed -b introns.bed -c > DeepZ_introns.bed
    bedtools intersect -a DeepZ.bed -b promoters.bed -c > DeepZ_promoters.bed
    
    Пересекаем метку и Z-DNA:
    bedtools intersect -a DeepZ.bed -b H2AFZ_bone_marrow_hg19_filtered_merged.bed > H2AFZ_bone_marrow_intersect_with_DeepZ.bed
    
    Команды для genome browser:
    track visibility=dense name="DeepZ" color=0,200,0 description="DeepZ"
    https://raw.githubusercontent.com/adriadar/hse21_H2AFZ_ZDNA_human/main/data/DeepZ.bed?token=AN743GRKIDFVGSK5X3XEC73BQ7GA6
    track visibility=dense name="intersect_with_DeepZ" color=200,0,0 description="H3K4me3_A549.intersect_with_DeepZ.bed"
    https://raw.githubusercontent.com/adriadar/hse21_H2AFZ_ZDNA_human/main/data/H2AFZ_bone_marrow_intersect_with_DeepZ.bed?token=AN743GUOZ7LE46PXJXELG5TBQ7GFC
    
```
