#!/usr/bin/env bash
#
# Add a sequence for RadiophamaceuticalInformation to an input DICOM (or folder with DICOM files)
#

#  "/Users/hes083/OneDrive - University of Bergen/Postdoc/Data/MRI/PET-MR MRSolutions/211206/2697/2/PTD_OSEM_2697_0001_0277.dcm"
# Here an example header
#(0054,0016) SQ (Sequence with explicit length #=1)      # 470, 1 RadiopharmaceuticalInformationSequence
#  (fffe,e000) na (Item with explicit length #=17)         # 462, 1 Item
#    (0009,0010) LO [MEDISO-1]                               #   8, 1 PrivateCreator
#    (0009,10ee) DT [20200305100500.685]                     #  18, 1 Unknown Tag & Data
#    (0009,10ef) DT [20200305111300.303]                     #  18, 1 Unknown Tag & Data
#    (0009,10f0) FD 19.5                                     #   8, 1 Unknown Tag & Data
#    (0009,10f1) FD 0.9                                      #   8, 1 Unknown Tag & Data
#    (0009,10f2) FD 0.2                                      #   8, 1 Unknown Tag & Data
#    (0009,10f3) FD 0                                        #   8, 1 Unknown Tag & Data
#    (0009,10fa) ST [MBq]                                    #   4, 1 Unknown Tag & Data
#    (0009,10fb) US 1                                        #   2, 1 Unknown Tag & Data
#    (0018,1071) DS [0.2]                                    #   4, 1 RadiopharmaceuticalVolume
#    (0018,1074) DS [8100000.500000]                         #  14, 1 RadionuclideTotalDose
#    (0018,1075) DS [6586.2]                                 #   6, 1 RadionuclideHalfLife
#    (0018,1076) DS [0.9673]                                 #   6, 1 RadionuclidePositronFraction
#    (0018,1078) DT [20200305100928.053]                     #  18, 1 RadiopharmaceuticalStartDateTime
#    (0054,0300) SQ (Sequence with explicit length #=1)      #  56, 1 RadionuclideCodeSequence
#      (fffe,e000) na (Item with explicit length #=3)          #  48, 1 Item
#        (0008,0100) SH [C-111A1]                                #   8, 1 CodeValue
#        (0008,0102) SH [SRT]                                    #   4, 1 CodingSchemeDesignator
#        (0008,0104) LO [^18^Fluorine]                           #  12, 1 CodeMeaning
#      (fffe,e00d) na (ItemDelimitationItem for re-encoding)   #   0, 0 ItemDelimitationItem
#    (fffe,e0dd) na (SequenceDelimitationItem for re-encod.) #   0, 0 SequenceDelimitationItem
#    (0054,0302) SQ (Sequence with explicit length #=1)      #  60, 1 AdministrationRouteCodeSequence
#      (fffe,e000) na (Item with explicit length #=3)          #  52, 1 Item
#        (0008,0100) SH [G-D101]                                 #   6, 1 CodeValue
#        (0008,0102) SH [SRT]                                    #   4, 1 CodingSchemeDesignator
#        (0008,0104) LO [Intravenous route]                      #  18, 1 CodeMeaning
#      (fffe,e00d) na (ItemDelimitationItem for re-encoding)   #   0, 0 ItemDelimitationItem
#    (fffe,e0dd) na (SequenceDelimitationItem for re-encod.) #   0, 0 SequenceDelimitationItem
#    (0054,0304) SQ (Sequence with explicit length #=1)      #  68, 1 RadiopharmaceuticalCodeSequence
#      (fffe,e000) na (Item with explicit length #=3)          #  60, 1 Item
#        (0008,0100) SH [C-B1031]                                #   8, 1 CodeValue
#        (0008,0102) SH [SRT]                                    #   4, 1 CodingSchemeDesignator
#        (0008,0104) LO [Fluorodeoxyglucose F^18^]               #  24, 1 CodeMeaning
#      (fffe,e00d) na (ItemDelimitationItem for re-encoding)   #   0, 0 ItemDelimitationItem
#    (fffe,e0dd) na (SequenceDelimitationItem for re-encod.) #   0, 0 SequenceDelimitationItem
#  (fffe,e00d) na (ItemDelimitationItem for re-encoding)   #   0, 0 ItemDelimitationItem
#(fffe,e0dd) na (SequenceDelimitationItem for re-encod.) #   0, 0 SequenceDelimitationItem

# the same in xml
#<sequence tag="0054,0016" vr="SQ" card="1" len="470" name="RadiopharmaceuticalInformationSequence">
#<item card="17" len="462">
#<element tag="0009,0010" vr="LO" vm="1" len="8" name="PrivateCreator">MEDISO-1</element>
#<element tag="0009,10ee" vr="DT" vm="1" len="18" name="Unknown Tag &amp; Data">20200305100500.685</element>
#<element tag="0009,10ef" vr="DT" vm="1" len="18" name="Unknown Tag &amp; Data">20200305111300.303</element>
#<element tag="0009,10f0" vr="FD" vm="1" len="8" name="Unknown Tag &amp; Data">19.5</element>
#<element tag="0009,10f1" vr="FD" vm="1" len="8" name="Unknown Tag &amp; Data">0.9</element>
#<element tag="0009,10f2" vr="FD" vm="1" len="8" name="Unknown Tag &amp; Data">0.2</element>
#<element tag="0009,10f3" vr="FD" vm="1" len="8" name="Unknown Tag &amp; Data">0</element>
#<element tag="0009,10fa" vr="ST" vm="1" len="4" name="Unknown Tag &amp; Data">MBq</element>
#<element tag="0009,10fb" vr="US" vm="1" len="2" name="Unknown Tag &amp; Data">1</element>
#<element tag="0018,1071" vr="DS" vm="1" len="4" name="RadiopharmaceuticalVolume">0.2</element>
#<element tag="0018,1074" vr="DS" vm="1" len="14" name="RadionuclideTotalDose">8100000.500000</element>
#<element tag="0018,1075" vr="DS" vm="1" len="6" name="RadionuclideHalfLife">6586.2</element>
#<element tag="0018,1076" vr="DS" vm="1" len="6" name="RadionuclidePositronFraction">0.9673</element>
#<element tag="0018,1078" vr="DT" vm="1" len="18" name="RadiopharmaceuticalStartDateTime">20200305100928.053</element>
#<sequence tag="0054,0300" vr="SQ" card="1" len="56" name="RadionuclideCodeSequence">
#<item card="3" len="48">
#<element tag="0008,0100" vr="SH" vm="1" len="8" name="CodeValue">C-111A1</element>
#<element tag="0008,0102" vr="SH" vm="1" len="4" name="CodingSchemeDesignator">SRT</element>
#<element tag="0008,0104" vr="LO" vm="1" len="12" name="CodeMeaning">^18^Fluorine</element>
#</item>
#</sequence>

# get the dose information from input DICOM
input="$1"
output="$2"

if [ -z "$input" ]; then
    echo "Error: no input specified!"
    exit -1
fi

if [ -z "$output" ]; then
    echo "Error: no output specified!"
    exit -1
fi

if [ ! -d "$output" ]; then
    echo "create output folder"
    mkdir -p "$output"
fi

function changeDICOM () {
    cp "$input" "/tmp/bla.dcm"
    input="/tmp/bla.dcm"

    # read dose information from input
    #(0018,1074) DS [8100000.500000]                         #  14, 1 RadionuclideTotalDose
    #(0018,1075) DS [6586.199707]                            #  12, 1 RadionuclideHalfLife
    #(0018,1076) DS [0.970000]                               #   8, 1 RadionuclidePositronFraction
    #(0018,1078) DT [20211206134309]                         #  14, 1 RadiopharmaceuticalStartDateTime
    #(0018,0031) LO [F-18]                                   #   4, 1 Radiopharmaceutical

    radiopharma=$( dcmdump +P 0018,0031 "$input" | cut -d'[' -f2 | cut -d']' -f1)
    echo "Radiopharmaceutical (from input file $input): $radiopharma"
    dosetotal=$( dcmdump +P 0018,1074 "$input" | cut -d'[' -f2 | cut -d']' -f1)
    echo "Totaldose (from input file $input): $dosetotal"
    halflife=$( dcmdump +P 0018,1075 "$input" | cut -d'[' -f2 | cut -d']' -f1)
    echo "Halflife (from input file $input): $halflife"
    positronfraction=$( dcmdump +P 0018,1076 "$input" | cut -d'[' -f2 | cut -d']' -f1)
    echo "Positron fraction (from input file $input): $positronfraction"
    startdate=$( dcmdump +P 0018,1078 "$input" | cut -d'[' -f2 | cut -d']' -f1)
    echo "Start date (from input file $input): $startdate"

    # add this value to the template.dcm file from  which we will copy the values
    dcmodify -m "(0054,0016)[0].(0018,1074)=$dosetotal" template.dcm

    # we would want to run this:
    # dcmodify -if "(0054,0016)[0].(0018,0015)=template.dcm" test2.dcm

    dd="dicom.dic"
    # add a sequence for 0054,0016 RadiopharmaceuticalInformationSequence
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,0010)=MEDISO-1" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10ee)=20200305100500.685" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10ef)=20200305111300.303" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10f0)=19.5" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10f1)=0.9" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10f2)=0.2" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10f3)=0" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10fa)=MBq" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0009,10fb)=1" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0018,1071)=0.2" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0018,1074)=8100000.500000" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0018,1075)=6586.2" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0018,1076)=0.9673" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0018,1078)=20200305100928.053" "$input"

    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0054,0300)[0].(0008,0100)=C-111A1" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0054,0300)[0].(0008,0102)=SRT" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0054,0300)[0].(0008,0104)=^18^Fluorine" "$input"

    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0054,0302)[0].(0008,0100)=G-D101" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0054,0302)[0].(0008,0102)=SRT" "$input"
    DCMDICTPATH=$dd dcmodify -nb -i "(0054,0016)[0].(0054,0302)[0].(0008,0104)=Intravenous route" "$input"

    echo "output: \"$output/$ofn\""
    mv "$input" "$output/$ofn"
}


# make a copy of each input
if [ -d $input ]; then
    echo "Process every file"
    find "$input" -print0 | while read -d $'\0' file; do 
      #cp -v "$file" /tmp; 
      input="$file"
      ofn=$(basename "$file")
      changeDICOM
    done
    exit -1
else
    # use the input file and process that
    ofn=$(basename "$input")
    changeDICOM
fi
