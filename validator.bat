@echo off 
REM Change directory to the location of your script  
cd /d C:\Users\138\Documents\GitHub\ITB-SHACL-Validator

REM Run the Java command script with command-line arguments  
java "-Dvalidator.resourceRoot=C:\Users\138\Documents\GitHub\ITB-SHACL-Validator\resources" -jar validator.jar

REM Optionally pause to see the output  
pause 