#samples= ["data/barcode01/barcode01"]

configfile: "config.yaml"

samples=config["samples"]

rule all:
     input:
        expand("results/{sample}.json", sample=samples),
        expand("results/{sample}.html", sample=samples)
#        expand("{sample}.vcf", sample=samples)



rule fastp:
    input:
        "{sample}.fastq.gz"        
    output:
        "results/{sample}.json",
        "results/{sample}.html",
        "results/{sample}-fastp.fastq.gz"

    shell:
        "fastp --detect_adapter_for_pe -i {wildcards.sample}.fastq.gz -o results/{wildcards.sample}-fastp.fastq.gz -j results/{wildcards.sample}.json -h results/{wildcards.sample}.html"
