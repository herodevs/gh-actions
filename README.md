# Shareable Github Actions

The actions defined in this repository can be reused across all of the NES github organization.

- [Init](#init)
- [Cache](#cache)
- [Uncache](#uncache)

## Init

This action will:

- authenticate with github
- checkout the code from the repo
- initialize node

```
- name: init
  uses: herodevs/gh-actions/init@v1
  with:
    node-version: 18
```

## Cache

### Inputs

`job` - The name of the current job in which you wish to cache
NOTE - this is used to build the key name of the cache being created

### Usage
```
- name: cache
  uses: herodevs/gh-actions/cache@v1
  with:
    job: [JOB_NAME]
```

## Uncache

### Inputs

`job-name` - The name of the job in which you wish to restore from.

### Usage
```
- name: uncache
  uses: herodevs/gh-actions/uncache@v1
  with:
    from-job: [JOB_NAME]
```