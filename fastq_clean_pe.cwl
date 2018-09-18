#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
      - $import: readgroup.yml
  - class: StepInputExpressionRequirement

class: Workflow

inputs:
  - id: input
    type: readgroup.yml#readgroup_fastq_pe_file

outputs:
  - id: clean_fastq1
    type: File
    outputSource: fastq_cleaner_pe/cleaned_fastq1
  - id: clean_fastq2
    type: File
    outputSource: fastq_cleaner_pe/cleaned_fastq2

steps:
  - id: fastq_cleaner_pe
    run: fastq_cleaner_pe.cwl
    in:
      - id: fastq1
        source: input
        valueFrom: $(self.forward_fastq)
      - id: fastq2
        source: input
        valueFrom: $(self.reverse_fastq)
    out:
      - id: cleaned_fastq1
      - id: cleaned_fastq2
