#!/bin/bash
  
intro="Using AGS for some time now, here's a list of things I made!"
footnote=("Thank you for reading this list." "https://gist.github.com/ericoporto/a3d437af481a14609cfbef95e7a9a293" "https://gist.githubusercontent.com/ericoporto/6426d9e819f4eccb74c4f47f6d7dfcb5/raw/README.BBCode" "https://github.com/ericoporto/my-ags-stuff-automator")
  
scriptModules=(
    "ImGi" "Immediate GuI script module using Overlays for AGS." ""
    "math3d" "A script module for 3D math on Adventure Game Studio."  ""
    "rellax" "Rellax camera tracks with parallax, adds smooth scroll." ""
    "controlz" "Move your character with keyboard or joystick controlz for Adventure Game Studio." ""
    "arrowselect" "Select things using arrows, module for in point and click games made with Adventure Game Studio." ""
    "tap" "Module for Test Anything Protocol with Adventure Game Studio." ""
    "jsonparser" "a JSON minimal parser for Adventure Game Studio."  ""
    "resizablegui" "Resizable GUIs module for Adventure Game Studio with optional mouse controls for resizing." ""
    "SierraSpeech" "AGS module for Sierra style conversations forked from speech bubble." ""
    "adventureJoy" "module for easily enabling joystick support on an Adventure Game Studio project (requires agsjoy plugin)." ""
    "NormRnd" "An Adventure Game Studio module to generate standard normal random numbers." ""
) 

agsPluginsWithAzureIntegration=(
    "agsimgui" "An ImGui plugin for Adventure Game Studio, so you can create beautiful and fast GUIs using AGS Script." ""
    "agsbox2d" "AgsBox2D is a physics plugin for Adventure Game Studio that gives access to the Box2D library created by Erin Catto. API is more inspired in the one used in Löve than the original Box2D one." ""
    "agssqlite" "SQLite plugin for Adventure Game Studio, adds way to store and retrieve information from local SQLite databases!"  ""
    "agsfastwfc" "AGS Fast Wave Function Collapse Plugin, makes magical self fiting tile patterns!" ""
)

agsPluginsWithTravisIntegration=(
    "agsjoy" "Reverse engineered version of the agsjoy plugin, includes Linux port." ""
    "agsshell" "AGS Shell plugin for Linux and Windows, run command line from ags." ""
)
 
agsEditorPluginsWithAzureIntegration=(
    "agsModuleList" "includes both the agsModuleList website and the agsget Editor Plugin, which makes finding and downloading AGS Modules easy. If you want to update or add your module, open a PR. Any questions, open an issue." "agsget"
)

openSourceGames=(
    "dogfromhell" "Hell's Puppy" "https://bakudas.itch.io/hells-puppy"
    "DungeonHands" "Dungeon Hands" "https://eri0o.itch.io/dungeon-hands"
)

miscellaneousRepo=(
    "agsconfig" "cross platform setup GUI for AGS games" "easy to customize, similar to the traditional winsetup.exe, for any platform"
    "teafortwo" "Tea for Two Android Studio Project" "This repository may be useful for one porting their own AGS game to Android. I added a README that tries to go throgh things step by step"
    "ags-script-language-server" "AGS Script Language Server"  "WIP AGS Script LSP for code analysis in LSP capable IDEs. Typescript code, need help!"
    "ags-choco-pkg" "Adventure Game Studio Chocolatey package" "Packaging code for AGS on Chocolatey, the other Windows package manager."
    "ash2doc" "ash2doc" "From ashes to documentation, turn AGS Script Header files into friendly text in Markdown or BBCode. WIP, JS, help needed."
)

forksWithAzureIntegration=(
    "AGS-Controller" "AGS-Controller is a SDL2 Gamepad plugin for AGS, this fork has CI integration to provide automatic cross platform builds." "agscontroller"
    "AGSWaves" "AGSWaves provides helpful features to work around ags3 sound limitation and other things. This fork has CI integration to provide automatic cross platform builds." ""
    "agslua" "agslua plugin adds lua support to 3.x AGS Editor. This fork adds CI integration to provide builds for Linux and MacOS." ""
    "AGSNormalMap" "Adds normalmaps for AGS! This fork adds CI integration to provide cross platform builds."  "agsnormalmaps"
)

forksWithCirrusCiIntegration=(
    "ags" "personal fork of ags where I do development experiments." ""
    "lib-allegro" "personal fork of lib-allegro for experimenting."  ""
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


function printMiscellaneous() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=3));
      do    
          reponame="${arr[i]}"
          humanname="${arr[i+1]}"
          description="${arr[i+2]}"          
          
          if [ ${DO_MARKDOWN} -eq 1 ]; then       
              echo "- [${humanname}](https://github.com/ericoporto/${reponame}) "
              echo "  - ${description}"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${humanname}[/url][/b][/li][list]
[li]${description}[/li]
[/list][/list]"         
          fi
      done
}     

function printOpenSourceGames() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=3));
      do    
          reponame="${arr[i]}"
          gamename="${arr[i+1]}"
          website="${arr[i+2]}"          
          
          if [ ${DO_MARKDOWN} -eq 1 ]; then       
              echo "- [${gamename}](https://github.com/ericoporto/${reponame}) | [**\`Game Download Page⇩\`**](${website})"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${gamename}[/url][/b] | [u][url=${website}][tt]Game Download Page ⇩[/tt][/url][/u][/li][/list]"         
          fi
      done
}

function writeFootNote() {
   arr=("$@")
   footnote_text="${arr[0]}"
   link_gist_markdown="${arr[1]}"
   link_gist_bbcode="${arr[2]}"
   link_github_repo="${arr[3]}"
   if [ ${DO_MARKDOWN} -eq 1 ]; then
       echo "$footnote_text"
       echo "If something is broken or needs changes, open an issue or hit me up on the forums."
       echo ""
       echo "[Markdown]($link_gist_markdown) | [PHP BB]($link_gist_bbcode) | [Repo]($link_github_repo)"
   else
       echo "$footnote_text"
       echo "[url=$link_gist_markdown]Markdown version[/url] | [url=$link_github_repo]GitHub repo for this[/url]"
       
   fi
}
 
function printWithAzurePipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=3));
      do    
          reponame="${arr[i]}"
          description="${arr[i+1]}"
          ciname="${arr[i+2]}"
          if [ ! -n "$ciname" ]; then   
            ciname="${reponame}"
          fi          
          
          if [ ${DO_MARKDOWN} -eq 1 ]; then       
              echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [**\`Downloads ⇩\`**](https://github.com/ericoporto/${reponame}/releases) | [![Build Status](https://dev.azure.com/ericoporto/${ciname}/_apis/build/status/ericoporto.${reponame}?branchName=master)](https://dev.azure.com/ericoporto/${ciname}/_build/latest?definitionId=12&branchName=master)"
              echo "  - ${description}"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${reponame}[/url][/b] | [u][url=https://github.com/ericoporto/${reponame}/releases][tt]Downloads ⇩[/tt][/url][/u] | [url=https://dev.azure.com/ericoporto/${ciname}/_build/latest?definitionId=12&branchName=master][img]https://dev.azure.com/ericoporto/${ciname}/_apis/build/status/ericoporto.${reponame}?branchName=master[/img][/url][/li][list]
[li]${description}[/li]
[/list][/list]"         
          fi
      done
}

function printWithCirrusCiPipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=3));
      do      
          reponame="${arr[i]}"
          description="${arr[i+1]}"
             
          if [ ${DO_MARKDOWN} -eq 1 ]; then   
              echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [![Build Status](https://api.cirrus-ci.com/github/ericoporto/${reponame}.svg)](https://cirrus-ci.com/github/ericoporto/${reponame})"
              echo "  - ${description}"
              echo ""
#          else
#              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${reponame}[/url][/b] | [url=https://cirrus-ci.com/github/ericoporto/${reponame}][img]https://api.cirrus-ci.com/github/ericoporto/${reponame}.svg[/img][/url][/li][list]
#[li]${description}[/li]
#[/list][/list]"   
          fi
      done
}

function printWithTravisCiPipelines() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=3));
      do      
          reponame="${arr[i]}"
          description="${arr[i+1]}"
             
          if [ ${DO_MARKDOWN} -eq 1 ]; then   
              echo "- [${reponame}](https://github.com/ericoporto/${reponame}) | [**\`Downloads ⇩\`**](https://github.com/ericoporto/${reponame}/releases) | [![Build Status](https://travis-ci.org/ericoporto/${reponame}.svg?branch=master)](https://travis-ci.org/ericoporto/${reponame})"
              echo "  - ${description}"
              echo ""
          else
              echo "[list][li][b][url=https://github.com/ericoporto/${reponame}]${reponame}[/url][/b] | [u][url=https://github.com/ericoporto/${reponame}/releases][tt]Downloads ⇩[/tt][/url][/u] | [url=https://travis-ci.org/ericoporto/${reponame}][img]https://travis-ci.org/ericoporto/${reponame}.svg?branch=master[/img][/url][/li][list]
[li]${description}[/li]
[/list][/list]"   
          fi
      done
}

function printWithReleasesOnly() {
   arr=("$@")
   for ((i=0;i< ${#arr[@]} ;i+=3));
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
printWithTravisCiPipelines "${agsPluginsWithTravisIntegration[@]}"
echo ""

printH2 "Editor Plugins"
printWithAzurePipelines "${agsEditorPluginsWithAzureIntegration[@]}"
echo ""

printH2 "Open Source Games"
printOpenSourceGames "${openSourceGames[@]}"
echo ""

printH2 "Miscellaneous"
printMiscellaneous "${miscellaneousRepo[@]}"
echo ""

printH2 "Forks"
printWithAzurePipelines "${forksWithAzureIntegration[@]}"
printWithCirrusCiPipelines "${forksWithCirrusCiIntegration[@]}"
echo ""

writeFootNote "${footnote[@]}"
