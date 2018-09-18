#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: Workflow

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
      - $import: readgroup.yml
  - class: StepInputExpressionRequirement
  - class: SubworkflowFeatureRequirement

inputs:
  - id: readgroup_fastq_pe_file
    type: readgroup.yml#readgroup_fastq_pe_file

outputs:
  []

steps:
  - id: fastq_clean_pe
    run: fastq_clean_pe.cwl
    in:
      - id: input
        source: readgroup_fastq_pe_file
    out:
      - id: clean_fastq1
      - id: clean_fastq2

  # - id: fastq_cleaner_pe
  #   run: fastq_cleaner_pe.cwl
  #   in:
  #     - id: fastq1
  #       source: readgroup_fastq_pe_file
  #       valueFrom: $(self.forward_fastq)
  #     - id: fastq2
  #       source: readgroup_fastq_pe_file
  #       valueFrom: $(self.reverse_fastq)
  #   out:
  #     - id: cleaned_fastq1
  #     - id: cleaned_fastq2
