#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerPull: alpine
  - class: InlineJavascriptRequirement

class: CommandLineTool

inputs:
  - id: fastq1
    type: File
    format: "edam:format_2182"

  - id: fastq2
    type: File
    format: "edam:format_2182"

outputs:
  - id: cleaned_fastq1
    type: File
    format: "edam:format_2182"
    outputBinding:
      glob: fastq1

  - id: cleaned_fastq2
    type: File
    format: "edam:format_2182"
    outputBinding:
      glob: fastq2

baseCommand: [touch, fastq1, fastq2]
