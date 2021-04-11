<?xml version="1.1" encoding="UTF-8" standalone="no"?>
<flow-definition plugin="{__flowPlugin__}">
    <actions/>
    <description/>
    <keepDependencies>false</keepDependencies>
    <properties>
        
    </properties>
    <definition class="org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition" plugin="{__definitionPlugin__}">
        <script>{__pipelineScript__}</script>
        <sandbox>true</sandbox>
    </definition>
    <triggers/>
    <disabled>false</disabled>
</flow-definition>