# Variación genotípica del gen OR6A2 en diferentes nacionalidades 

Olivia Yerovi (oiyerovi@puce.edu.ec)
1 de julio del 2025

## Introducción

El gen OR6A2 es un receptor olfativo que se encuentra en el cromosoma 11 dentro de un grupo de ocho genes receptores 
olfativos (Erikson et al., 2012). Este gen es responsable de detectar los químicos llamados ‘aldehídos’que también se encuentran en el jabón, 
lo que provoca que algunas personas perciban un sabor jabonoso en el cilantro cuando existe una variación en este gen, 
la cual se cree que se debe al polimorfismo de un solo nucleótido (SNP) rs72921001 (Erikson et al., 2012).
Los individuos con el alelo A (dominante) de esta variación tienen menos propensión a percibir 
un sabor jabonoso,por lo que se podría concluir que los individuos homocigotos recesivos tienden a percibir 
al cilantro como jabón (Watson, 2021).

El propósito del proyecto es observar cómo la variante del gen OR6A2 que contiene el SNP rs72921001 se distribuye
entre diferentes nacionalidades. Para esto, se obtendrán datos del genotipo de individuos con distintas
nacionalidades (obtenido del catálogo de variaciones genéticas "1000 genomes prroject") y se generarán análisis filogenéticos para observar las relaciones que existen entre los individuos
con la variante homocigótica de este gen, con el fin de rastrear qué nacionalidades son las más ancestrales en 
presentar esta variación. También se analizarán cuales son las nacionalidades que presentan más y menos esta
variación. 

![_Coriandrum sativum_](https://www.hola.com/horizon/landscape/82af1a662e49-portada-age-t.jpg)

## Dependencias

* Hoffman2 - El Clúster Hoffman2 es el recurso centralizado de computación de alto rendimiento (HPC) de UCLA. 
La HPC puede ser una solución cuando sus necesidades de datos y computación superan las capacidades de 
una computadora personal. 

* Bcftools - BCFtools es un conjunto de utilidades que manipulan y trabajan con archivos en formato VCF
(Variant Call Format) y su equivalente binario, BCF.Todos los comandos funcionan con VCF y BCF, tanto sin comprimir con BGZF.  
 
* Iqtree2 - Un algoritmo de búsqueda rápida para inferir árboles filogenéticos por máxima verosimilitud. 

* Muscle - Permite realizar una alineación de múltiples secuencias lo que permite la evaluación de 
análisis posteriores, como árboles filogenéticos. 

* Bgzip - Bgzip comprime archivos de manera similar y compatible con gzip(1). 

* Tabix - Tabix indexa un archivo de posición genómica delimitado por tabulaciones en .tab.bgz y crea un archivo de índice (in.tab.bgz.tbi o in.tab.bgz.csi) cuando la región no está presente en la línea de comandos. El archivo de datos de entrada debe ordenarse por posición y comprimirse mediante bgzip, que tiene una interfaz similar a gzip(1).

## Workflow del programa

- 1. Descargar los archivos de diferentes genotipos de la base de datos"1000 genomes project" en formato .VCF.
- 2. Descargar lista de personas (ID) y su lugar de procedencia. 
- 3. Seleccionar de las bases de datos el loci en donde se encuentra esta variante, para sólo trabajar con este gen.
- 4. Filtrar los individuos que tienen el alelo homocigoto aa con el SNP rs72921001.
- 5. Convertir el archivo VCF a formato FASTA
- 6. Alinear con MUSCLE
- 7. Realizar IQTREE al archivo alineado 
- 8. Visualizar el archivo en FigTree

## Resultados Esperados

Se espera observar una filogenia que indique cuál es la nacionalidad más ancestral con el SNP rs72921001 en el gen 
OR6A2 y que presentan el genotipo aa, al igual que las nacionalidades que más y menos presentan esta variación. 


## Bibliografía

* Bcftools(1). (s/f). Github.Io. Recuperado el 2 de julio de 2025, de https://samtools.github.io/bcftools/bcftools.html
* bgzip(1) manual page. (s/f). Htslib.org. Recuperado el 2 de julio de 2025, de https://www.htslib.org/doc/bgzip.html
* Eriksson, N., Wu, S., Do, C. B., Kiefer, A. K., Tung, J. Y., Mountain, J. L., Hinds, D. A., & Francke, U. (2012). A genetic variant near olfactory receptor genes influences cilantro preference. Flavour, 1(1), 22. https://doi.org/10.1186/2044-7248-1-22
* Hoffman2 high-performance compute Cluster. (s/f). Ucla.edu. Recuperado el 2 de julio de 2025, de https://oarc.ucla.edu/get-help/tools-and-solutions/hoffman2-high-performance-compute-cluster
* Nguyen, L.-T., Schmidt, H. A., von Haeseler, A., & Minh, B. Q. (2014). IQ-TREE: A Fast and Effective Stochastic Algorithm for Estimating Maximum-Likelihood Phylogenies. Oup.com. https://doi.org/10.1093/molbev/msu300
* tabix(1) manual page. (s/f). Htslib.org. Recuperado el 2 de julio de 2025, de https://www.htslib.org/doc/tabix.html
* RCEDGAR. (s/f). Muscle. Recuperado el 2 de julio de 2025, de https://github.com/rcedgar/muscle
* Watson, B. (2021, junio 15). How genes influence your preference for cilantro. Xcode Life. https://www.xcode.life/genes-and-nutrition/how-genes-influence-your-preference-for-cilantro/

