cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  direct-oral-anticoagulants-doacs-110mg---primary:
    run: direct-oral-anticoagulants-doacs-110mg---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  direct-oral-anticoagulants-doacs-apixaban---primary:
    run: direct-oral-anticoagulants-doacs-apixaban---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-110mg---primary/output
  direct-oral-anticoagulants-doacs-xarelto---primary:
    run: direct-oral-anticoagulants-doacs-xarelto---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-apixaban---primary/output
  direct-oral-anticoagulants-doacs-rivaroxaban---primary:
    run: direct-oral-anticoagulants-doacs-rivaroxaban---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-xarelto---primary/output
  direct-oral-anticoagulants-doacs-eliqui---primary:
    run: direct-oral-anticoagulants-doacs-eliqui---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-rivaroxaban---primary/output
  direct-oral-anticoagulants-doacs-150mg---primary:
    run: direct-oral-anticoagulants-doacs-150mg---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-eliqui---primary/output
  direct-oral-anticoagulants-doacs-edoxaban---primary:
    run: direct-oral-anticoagulants-doacs-edoxaban---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-150mg---primary/output
  direct-oral-anticoagulants-doacs-lixiana---primary:
    run: direct-oral-anticoagulants-doacs-lixiana---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-edoxaban---primary/output
  direct-oral-anticoagulants-doacs-etexilate---primary:
    run: direct-oral-anticoagulants-doacs-etexilate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-lixiana---primary/output
  direct-oral-anticoagulants-doacs-pradaxa---primary:
    run: direct-oral-anticoagulants-doacs-pradaxa---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-etexilate---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: direct-oral-anticoagulants-doacs-pradaxa---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
