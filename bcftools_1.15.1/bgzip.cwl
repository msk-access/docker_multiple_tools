class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: tabix
baseCommand:
  - bgzip
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
outputs:
  - id: zippedVcf
    type: File?
    outputBinding:
      glob: >-
        ${     if(inputs.output_file_name){         return
        inputs.output_file_name     } else {         return
        inputs.input.basename.replace(/.vcf/,'.vcf.gz')     } }
label: tabix
arguments:
  - position: 0
    prefix: ''
    valueFrom: '-c'
requirements:
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/bcftools:1.15.1'
    useEntrypoint: false
  - class: InlineJavascriptRequirement
stdout: >-
  ${     if (inputs.output_file_name)       return inputs.output_file_name;    
  return inputs.input.basename.replace('.vcf','.vcf.gz');   }
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sivaprk@mskcc.org'
        'foaf:name': Karthigayini Sivaprakasam
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sivaprk@mskcc.org'
        'foaf:name': Karthigayini Sivaprakasam
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': bcftools
    'doap:revision': 1.15.1
