# Dockercontainer for FastANI Computation and Visualization

## Base Image
This Dockerfile is built on top of the official Python 3.8 Slim image, which provides a minimal Python environment.

## Working Directory
The working directory for the container is set to `/app`.

## Installed Packages
The following packages are installed within the container:
- **bash**: The Bash shell is installed to provide a shell environment.
- **pandas**: Pandas is a powerful data manipulation library for Python.
- **click**: Click is a Python package for creating command-line interfaces.
- **fastani**: FastANI is a tool for fast average nucleotide identity calculation [If you want to build the container, you'll have to download the binary from [here](https://github.com/ParBliSS/FastANI/releases).]
- **biopython**: Biopython is a collection of tools, libraries, and frameworks for computational biology.
- **pygenomeviz**: PyGenomeViz is a Python library for visualizing genomic data.

## Entrypoints
The container has three entrypoints:

1. Regular Python code for preparing data can be run with the following command:
   ```
   python3 script.py
   ```

2. FastANI, with the parameters described [here](https://github.com/ParBLiSS/FastANI), can be executed using the following example:
   ```
   fastANI -q [QUERY_GENOME] -r [REFERENCE_GENOME] -o [OUTPUT_FILE]
   ```

3. `visualize_two_genoms` (the Python script can be found in this repository) allows you to visualize two genomes against each other.
following example:
   ```
    visualize_two_genoms fasta_file1 fasta_file2 visual_file plot_outfile.png

   ```

#### Usage
To use this `visualize_two_genoms`-script, run it with the following arguments:

- `fasta_file1`: Input genome fasta file 1.
- `fasta_file2`: Input genome fasta file 2.
- `visual_file`: FastANI visual result file (name.out.visual).
- `plot_outfile`: Output plot file in formats such as *.jpg, *.png, *.svg, or *.pdf.

#### Optional Arguments
The script also accepts the following optional arguments:

- `--cmap`: Colormap for Matplotlib (Default: 'hsv').
- `--link_color`: Link color (Default: 'grey').
- `--curve`: Plot curved style link (Default: OFF).

