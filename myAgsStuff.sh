#!/bin/bash
  
intro="Using AGS for some time now, decided to look everything I open sourced and create a listing here! I will try to keep this list updated!"  
  
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
    "agsModuleList" "includes both the agsModuleList website and the agsget Editor Plugin, which makes finding and downloading AGS Modules easy. If you want to update or add your module, open a PR. Any questions, open an issue."
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

if [ "$1" != "" ] && [ "$1" != "markdown" ]; then
    DO_MARKDOWN=0
else
    DO_MARKDOWN=1
fi 

printText() {
  echo "$1"
}

function printH1() {
  if [ ${DO_MARKDOWN} -eq 1 ]; then
      echo "# $1"
  else
      echo "[size=16pt][b] $1 [/b][/size]"      
  fi 
  echo ""
}

function printH2() {
  if [ ${DO_MARKDOWN} -eq 1 ]; then
      echo "## $1"  
  else
      echo "[size=12pt][b] $1 [/b][/size]"
  fi 
  echo ""
}

 
function printWithAzurePipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=2));
      do    
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          if [ ${DO_MARKDOWN} -eq 1 ]; then       
              echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [![Build Status](https://dev.azure.com/ericoporto/${reponame}/_apis/build/status/ericoporto.${reponame}?branchName=master)](https://dev.azure.com/ericoporto/${reponame}/_build/latest?definitionId=12&branchName=master) | [**\`Downloads ⇩\`**](https://github.com/ericoporto/${reponame}/releases)"
              echo "  - ${description}"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${reponame}[/url][/b]| [url=https://dev.azure.com/ericoporto/${reponame}/_build/latest?definitionId=12&branchName=master][img]https://dev.azure.com/ericoporto/${reponame}/_apis/build/status/ericoporto.${reponame}?branchName=master[/img][/url] | [u][url=https://github.com/ericoporto/${reponame}/releases][tt]Downloads ⇩[/tt][/url][/u][/li][list]
[li]${description}[/li]
[/list][/list]"         
          fi
      done
}

function printWithCirrusCiPipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=2));
      do      
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          if [ ${DO_MARKDOWN} -eq 1 ]; then   
              echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [![Build Status](https://api.cirrus-ci.com/github/ericoporto/${reponame}.svg)](https://cirrus-ci.com/github/ericoporto/${reponame})"
              echo "  - ${description}"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${reponame}[/url][/b] | [url=https://cirrus-ci.com/github/ericoporto/${reponame}][img]Build Status](https://api.cirrus-ci.com/github/ericoporto/${reponame}.svg[/img][/url][/li][list]
[li]${description}[/li]
[/list][/list]"   
          fi
      done
}

function printWithReleasesOnly() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=2));
      do
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          if [ ${DO_MARKDOWN} -eq 1 ]; then  
              echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [**\`Downloads ⇩\`**](https://github.com/ericoporto/${reponame}/releases)"
              echo "  - ${description}"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${reponame}[/url][/b] | [u][url=https://github.com/ericoporto/${reponame}/releases][tt]Downloads ⇩[/tt][/url][/u][/li][list]
[li]${description}[/li]
[/list][/list]"                
          fi
      done
}

printH1 "eri0o's Adventure Game Studio Repositories!"
printText "${intro}"
echo ""
 
printH2 "Script Modules"
printWithReleasesOnly "${scriptModules[@]}"
echo ""
 
printH2 "Engine Plugins"
printWithAzurePipelines "${agsPluginsWithAzureIntegration[@]}"
echo ""

printH2 "Editor Plugins"
printWithAzurePipelines "${agsEditorPluginsWithAzureIntegration[@]}"
echo ""

printH2 "Forks"
printWithAzurePipelines "${forksWithAzureIntegration[@]}"

printWithCirrusCiPipelines "${forksWithCirrusCiIntegration[@]}"
echo ""
 

