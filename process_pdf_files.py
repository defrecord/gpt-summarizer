import sys

def process_pdf_files():
    """Main function to read and process each PDF file found in the documents directory."""
    import glob
    import os
    from pathlib import Path

    documents_dir = Path("../splash-2023/documents/")
    python_script = "./summarize.py"

    # Gets list of all .pdf files in the documents_dir directory
    pdf_files = glob.glob(f"{documents_dir}/*.pdf")

    # Check if there are any .pdf files to process
    if not pdf_files:
        return  # Or, consider raising an exception 

    # Iterate over each .pdf file
    for pdf_file in pdf_files:
        print(pdf_file)
        # Run python_script for each .pdf file
        os.system(f"poetry run python3 {python_script} {pdf_file}")


# This makes sure the 'process_pdf_files' function is only called when this script file is run directly
# If it is imported as a module, the function will not be automatically called
if __name__ == "__main__":
    process_pdf_files()