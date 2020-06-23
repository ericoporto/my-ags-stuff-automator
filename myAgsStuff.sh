#!/bin/bash
 
scriptModules=(
    "math3d" "A script module for 3D math on Adventure Game Studio." 
    "rellax" "Rellax camera tracks with parallax, adds smooth scroll."
    "controlz" "Move your character with keyboard or joystick controlz for Adventure Game Studio."
    "arrowselect" "Select things using arrows, module for in point and click games made with Adventure Game Studio."
    "ags_test_game" "Example of Test Anything Protocol usage with Adventure Game Studio."
    "jsmnags" "JSMN, a JSON minimal parser, ported for Adventure Game Studio." 
    "resizablegui" "Resizable GUIs module for Adventure Game Studio with optional mouse controls for resizing."
    "SierraSpeech" "AGS module for Sierra style conversations forked from speech bubble."
    "adventureJoy" "module for easily enabling joystick support on an Adventure Game Studio project (requires agsjoy plugin)."
    "NormRnd" "An Adventure Game Studio module to generate standard normal random numbers."
) 

agsPluginsWithAzureIntegration=(
    "agsimgui" "An ImGui plugin for Adventure Game Studio, so you can create beautiful and fast GUIs using AGS Script."
    "agsbox" "AgsBox2D is a physics plugin for Adventure Game Studio that gives access to the Box2D library created by Erin Catto. API is more inspired in the one used in Löve than the original Box2D one."
    "agssqlite" "AGS Fast Wave Function Collapse Plugin, makes magical self fiting tile patterns!" 
    "agsfastwfc" "SQLite plugin for Adventure Game Studio, adds way to store and retrieve information from local SQLite databases!"
)
 
agsEditorPluginsWithAzureIntegration=(
    "agsModuleList" "includes both the [agsModuleList website](https://ericoporto.github.io/agsModuleList/) and the agsget Editor Plugin, which makes finding and downloading AGS Modules easy. If you want to update or add your module, open a PR. Any questions, open an issue."
)

forksWithAzureIntegration=(
    "AGS-Controller" "AGS-Controller is a SDL2 Gamepad plugin for AGS, this fork has CI integration to provide automatic cross platform builds."
    "AGSWaves" "AGSWaves provides helpful features to work around ags3 sound limitation and other things. This fork has CI integration to provide automatic cross platform builds."
    "agslua" "agslua plugin adds lua support to 3.x AGS Editor. This fork adds CI integration to provide builds for Linux and MacOS."
    "AGSNormalMap" "Adds normalmaps for AGS! This fork adds CI integration to provide cross platform builds."    
)

forksWithCirrusCiIntegration=(
    "ags" "personal fork of ags where I do development experiments."
    "lib-allegro" "personal fork of lib-allegro for experimenting."    
)
 
function printWithAzurePipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=2));
      do      
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [![Build Status](https://dev.azure.com/ericoporto/${reponame}/_apis/build/status/ericoporto.${reponame}?branchName=master)](https://dev.azure.com/ericoporto/${reponame}/_build/latest?definitionId=12&branchName=master) | [**\`Downloads ⇩\`**](https://github.com/ericoporto/${reponame}/releases)"
          echo "  - ${description}"
          echo ""
      done
   echo ""
}

function printWithCirrusCiPipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=2));
      do      
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [![Build Status](https://api.cirrus-ci.com/github/ericoporto/${reponame}.svg)](https://cirrus-ci.com/github/ericoporto/${reponame})"
          echo "  - ${description}"
          echo ""
      done
   echo ""
}

function printWithReleasesOnly() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=2));
      do
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [**\`Downloads ⇩\`**](https://github.com/ericoporto/${reponame}/releases)"
          echo "  - ${description}"
          echo ""
      done
   echo ""
}

echo "# eri0o's Adventure Game Studio Repositories!"
echo ""
 
echo "## Script Modules"
printWithReleasesOnly "${scriptModules[@]}"
echo ""
 
echo "## Engine Plugins"
printWithAzurePipelines "${agsPluginsWithAzureIntegration[@]}"
echo ""

echo "## Editor Plugins"
printWithAzurePipelines "${agsEditorPluginsWithAzureIntegration[@]}"
echo ""

echo "## Forks"
printWithAzurePipelines "${forksWithAzureIntegration[@]}"

printWithCirrusCiPipelines "${forksWithCirrusCiIntegration[@]}"
echo ""
 

