
import os

def search():
    # Prompt the user for the search path and query string
    path = input("Enter the search path: ")
    query = input("Enter the query string: ")

    # Use os.walk() to search for files and directories containing the query string
    for dirpath, dirnames, filenames in os.walk(path):
        for filename in filenames:
            if query in filename:
                print(os.path.join(dirpath, filename))
        for dirname in dirnames:
            if query in dirname:
                print(os.path.join(dirpath, dirname))

# Call the search() function to start the search
search()
