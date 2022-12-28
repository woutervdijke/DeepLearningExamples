#!/usr/bin/env bash

set -e

DATADIR="DefranSpeech"
FILELISTSDIR="filelists"

TESTLIST="$FILELISTSDIR/test.txt"
TRAINLIST="$FILELISTSDIR/list.txt"
VALLIST="$FILELISTSDIR/val.txt"

TESTLIST_MEL="$FILELISTSDIR/test_mels.txt"
TRAINLIST_MEL="$FILELISTSDIR/list_mels.txt"
VALLIST_MEL="$FILELISTSDIR/val_mels.txt"

mkdir -p "$DATADIR/mels"
if [ $(ls $DATADIR/mels | wc -l) -ne 13100 ]; then
    python preprocess_audio2mel.py --wav-files "$TRAINLIST" --mel-files "$TRAINLIST_MEL"
    python preprocess_audio2mel.py --wav-files "$TESTLIST" --mel-files "$TESTLIST_MEL"
    python preprocess_audio2mel.py --wav-files "$VALLIST" --mel-files "$VALLIST_MEL"	
fi	
