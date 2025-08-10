#!/bin/bash
cd /home/troli/SecondBrain || exit
git add . 
git commit -m "🔒 (Backup) $(date '+%d-%m-%Y %H:%M')"
git push origin main
