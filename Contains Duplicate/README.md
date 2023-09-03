# Initial Approach
Use Hash map to store value, then iterate through an array to check for 
duplicates. 

# Walkthrough
We have created an `emptyHash` variable which is a dictionary that can 
take `Integer` for both `Key` and `Value`.

By iterating through an array, we are checking if the value of the `nums` 
array exists in our created `emptyHash` property. 

If the value already exists, that means a duplicate value has been found, 
so we can return true as soon as we find the duplicate and end the 
iteration. 

However, if the value doesn't already exist, it means it's first time 
seeing the value, so we can store the value to keep track of it. 

After the iteration, if there aren't any duplicate, it means all elements 
are unique, so we can return false. 
