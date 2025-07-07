# Comparación y Análisis del Gen rpoB en _Escherichia coli_ y _Campylobacter jejuni_

## Introducción

El gen rpoB, que codifica la subunidad beta de la ARN polimerasa, se ha convertido en un gen candidato clave para los análisis filogenéticos y la identificación de bacterias, especialmente al estudiar aislados estrechamente relacionados.
La secuenciación de rpoB permite una estimación eficiente del contenido bacteriano de G+C%, el valor de hibridación ADN-ADN y la identidad nucleotídica promedio (Adékambi & Raoult, 2009). De hecho, estudios comparativos han demostrado que rpoB supera al 16S rRNA en precisión para clasificar bacterias a nivel de especie (Case et al., 2007)
Aunque rpoB se ha usado como marcador para identificar especies dentro del género Campylobacter (On et al., 1996), la comparación específica con E. coli puede proporcionar información valiosa sobre las diferencias evolutivas, estructurales y adaptativas entre estas bacterias.

![BACTERIA](https://www.cosemarozono.com/wp-content/uploads/2017/05/como-prevenir-infecciones-alimentarias-campylobacter-jejuni.jpg)
---

## Herramientas:
  - `BWA` BWA es un paquete de software para mapear secuencias de ADN con respecto a un genoma de referencia extenso, para instalar
se puede seguir las instrucciones del desarrollador aquí (https://github.com/lh3/bwa)

  - `SAMTOOLS` Samtools es un conjunto de programas para interactuar con datos de secuenciación de alto rendimiento. Se puede descargar desde
su página (https://www.htslib.org/download/) o desde su github (https://github.com/samtools/)

  - `MUSCLE`es un programa de software utilizado para alinear secuencias múltiples de proteínas o ácidos nucleicos. La descarga se puede realizar
desde el siguiente link (https://drive5.com/muscle/downloads_v3.htm)

  - `MESQUITE` Su objetivo es proporcionar un flujo de trabajo transparente que permita al usuario visualizar en tiempo real datos, árboles y análisis para que pueda
ver y comprender sus datos y resultados a medida que se procesan.
Se puede descargar desde su repositorio (https://github.com/MesquiteProject/MesquiteCore/releases)

---

## Estructura del Workflow

1. **Descarga de Datos de bacterias**
   - Lecturas Fastq de *E. coli* y *C. jejuni*.
   - Genomas de referencia completos fastq `ecoli_genome.fasta` y `jejuni_genome.fasta`

2. **Preparación del Entorno**
   - Carga de herramientas necesarias como samtools o bwa

3. **Indexación de Genomas**
   - Usar los genomas descargados `ecoli_genome.fasta` y `jejuni_genome.fasta`
   - Preparación para alineamiento con BWA y Samtools.

4. **Alineación y Procesamiento**
   - Alineación de lecturas.
   - Conversión a formato BAM.
   - Ordenamiento e indexación de archivos.

5. **Extracción del Gen rpoB**
   - Obtención de las secuencias específicas del gen rpoB en ambos organismos.

6. **Alineamiento Múltiple**
   - Fusión de las secuencias rpoB.
   - Alineamiento comparativo con MUSCLE.

---

## Resultados Esperados
Una vez corrido el programa se espera obtener un archivo alineado que muestra las diferencias y similitudes entre las secuencias rpoB de ambas bacterias.
Este archivo `muscle_rpoB.fasta` se verá en programa como Mesquite para el análisis de la secuencia.

# Bibliografía

Adékambi, T., Drancourt, M., & Raoult, D. (2009). The rpoB gene as a tool for clinical microbiologists. Trends in Microbiology, 17(1):37–45. DOI: 10.1016/j.tim.2008.09.008
On, S. L., Holmes, B., Sackin, M. J. (1996). A probability matrix for the identification of Campylobacters, Helicobacters and related taxa. Journal of Applied Bacteriology, 81(6), 425–432. DOI: 10.1111/j.1365-2672.1996.tb03529.x
Case, R. J., Boucher, Y., Dahllöf, I., Holmström, C., Doolittle, W. F., & Kjelleberg, S. (2007). Use of 16S rRNA and rpoB genes as molecular markers for microbial ecology studies. Environmental Microbiology, 9(3), 613–619.
