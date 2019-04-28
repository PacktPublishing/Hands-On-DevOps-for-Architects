from zipfile import ZipFile
import hashlib
import shutil
import os

# In this program we will package an application and deploy it to a target directory.
# Here are the steps:
#           1) Update the configuration file with target settings (e.g. port, DB etc)
#           2) Create the package and calculate SHA1
#           3) Deploy and recalculate SHA1 (to verify integrity of the package)

print ("deployApplication")
BUF_SIZE = 65536
DEBUG = 1
md5 = hashlib.md5()
sha1 = hashlib.sha1()

# change the configuration setting in a configuration file.
def configure(pattern, replace, infile, outfile):

    if (DEBUG):
        print("**in configure::", pattern, replace, infile, outfile)

    fin = open(infile, 'r')
    fout = open(outfile, 'w')

    ctr=0
    for line in fin:
        ctr = ctr + 1
        if (DEBUG):
            print("setting config...", line)

        if (line.find(pattern) != -1):
            out = line.replace(pattern, replace)
        else:
            out = line
        fout.write(out)
        fout.flush()

    fout.close()
    fin.close()

    return

# Returns all of the file paths for us to search
def get_all_file_paths(directory):
    file_paths = []

# crawling through directory and subdirectories
    for root, directories, files in os.walk(directory):
        for filename in files:
            filepath = os.path.join(root, filename)
            file_paths.append(filepath)

    return file_paths

# Calculate SHA1
def calcsha1hash(myfile):

    with open(myfile,"rb") as f:
        bytes = f.read() # read entire file as bytes
        mysha1hash = hashlib.sha256(bytes).hexdigest()

    if (DEBUG):
        print("sha1::")
        print(mysha1hash)

    return mysha1hash


def zipFiles(mydirectory, myzipfile):
    if (DEBUG):
        print("\nin zipfiles...")
        print("mydirectory=", mydirectory)
        print("myzipfile=", myzipfile)

    myfilesToZip = get_all_file_paths(mydirectory)

    with ZipFile(myzipfile,'w') as zip:
        for file in myfilesToZip:
            zip.write(file)

    if (DEBUG):
        print("\n leaving zipFiles\n")

    return


def copyFile(myfile, targetDirFile):
    if (DEBUG):
        print("\n in copyFile")
        print("myfile::", myfile)
        print("targetDir::", targetDirFile)

    shutil.copy(myfile, targetDirFile)
    if (DEBUG):
        print("leaving copyFile\n")

    return

# This is the main function
def main():

# Initialize cryptographic hashes
    md5 = hashlib.md5()
    sha1 = hashlib.sha1()  # We will use SHA1 for this example

# Initialize source and target directories
    templateDir = ""   # directory where the config template is lcoated

# directory for the config file we are updating
    configDir = "MavenWildflyExample\\myArtifactID\\src\\main\\resources"

# directory where the app is lcoated that we will zip, copy and verify
    directory = 'MavenWildflyExample'

# directory where we will copy the zip file and then recalculate the hash to verify
    targetDir = 'targetdir'

# Initialize template for configuration and the target configuration file that we will deploy
    infile = "configuration.template"
    outfile = "configuration.txt"

    if (DEBUG):
        print("Template Dir::", templateDir)
        print("Config Dir::", configDir)
        print("Input configuration file::", infile)
        print("Outfile configuration file::", outfile)
        print("\n")

# Configure a Port
    outfile = configDir + '\\' + outfile # configure writes to this file
    configure('COMMPORT1', '3302', infile, outfile)

    if (DEBUG):
        print("\n Next we zip...")

    myzipfile = 'myzipfile.zip'
    myzipfile2 = 'myzipfile.zip'
    zipFiles(directory, myzipfile)
    sha1hash1 = calcsha1hash(myzipfile)
    if (DEBUG):
        print("1. for zipfile", myzipfile, sha1hash1)

    # copy zipfile to targetDirectory
    if (DEBUG):
        print("myzipfile=", myzipfile)

    copyFile(myzipfile, targetDir)

    # recalculate hash to verify the deploy
    sha1hash1 = calcsha1hash(targetDir + '\\' + myzipfile2)
    if (DEBUG):
        print("2. for zipfile", myzipfile, sha1hash1)


# This is where we check the namespace and then call the main
if __name__ == "__main__":
    main()
