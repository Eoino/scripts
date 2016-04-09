#!/bin/bash
#
# Create a structured project directory hierarchy

PROJECT=$1

# Clean exisiting hierarchy
function clean() {
	echo "Cleaning exisiting project.."
	rm -rf "$1"
}

# Create project hierarchy
function create_project() {
	echo "Creating project directories.."
	mkdir "$1"
	mkdir "$1/bin"
	mkdir "$1/doc"
	mkdir "$1/src"
}

# Create project documents
function create_documents() {
	echo "Creating project documents.."
	echo "$1" > "$1/README.md"
}

# Main
if [[ -n "$PROJECT" ]]; then
	echo "Creating project.."

	write=true

	# Check for existing hierarchy
	if [ -d "$PROJECT" ]; then
		read -p "Overwrite existing project? y/n : " -r selection
		if [ "$selection" != "y" ] && [ "$selection" != "Y" ] ; then
			write=false
		fi
	fi

	# Attempt to create project hierarchy
	if [ "$write" = true ]; then
		echo "---"
		clean "$PROJECT"
		create_project "$PROJECT"
		create_documents "$PROJECT"
		echo "---"
		echo "Successfully created project $PROJECT"
	fi

else
	echo "error: project name not specified"
fi
