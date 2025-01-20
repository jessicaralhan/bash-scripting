read filename 
echo $filename
file_details=$(ls -l "$filename")
permissions=$(echo "$file_details" | awk '{print $1}')

# Extract individual parts of the permissions
owner=$(echo "$permissions" | cut -c2-4)  # Characters 2-4
group=$(echo "$permissions" | cut -c5-7)  # Characters 5-7
others=$(echo "$permissions" | cut -c8-10) # Characters 8-10

interpret_permissions() {
    local perm=$1
    local read="no"
    local write="no"
    local execute="no"

    # Check each permission bit
    [[ $perm == *r* ]] && read="yes"
    [[ $perm == *w* ]] && write="yes"
    [[ $perm == *x* ]] && execute="yes"

    # Return formatted output
    echo "Read: $read Write: $write Execute: $execute"
}

# Display the extracted information
echo "File: $1"
echo "Permissions: $permissions"
echo "Owner: $(interpret_permissions $owner)"
echo "Group: $(interpret_permissions $group)"
echo "Others: $(interpret_permissions $others)"