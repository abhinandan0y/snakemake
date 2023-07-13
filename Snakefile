#samples= ["data/barcode01/barcode01"]

configfile: "config.yaml"

samples=config["samples"]

rule all:
     input:     
        "output.txt",
        expand("{sample}.json", sample=samples),
        expand("{sample}.html", sample=samples)
#        expand("{sample}.vcf", sample=samples)



rule fastp:
    input:
        "{sample}.fastq.gz"        
    output:
        "{sample}.json",
        "{sample}.html",
        "{sample}-fastp.fastq.gz"

    shell:
        "fastp --detect_adapter_for_pe -i {wildcards.sample}.fastq.gz -o results/{wildcards.sample}-fastp.fastq.gz -j results/{wildcards.sample}.json -h results/{wildcards.sample}.html"
