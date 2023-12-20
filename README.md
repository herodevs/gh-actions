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

## Sauce

### Inputs
  `sauceUsername` - The sauce username to use to connect to sauce labs. Required.
  `sauceAccessKey` - The sauce access key to use to connect to sauce labs. Required.
  `sauceTunnelName` - The tunnel name to use. Required.
  `sauceTunnelDomain` - The sauce tunnel domain (default is `localhost`). Optional (default: `localhost`).
  `sauceConfig` - The path to the sauce config (default is `./.sauce/config.yml`). Optional (defalt: `./.sauce/config.yml`).
  `sauceRegion` - The sauce region/datacenter to run the browser tests in. Optional (default: `us-west`).
  `prerunScript` - Any script you want to run before running Sauce (eg. build/serve). Optional.

### Usage
```
- name: Run Browser Tests
  uses: neverendingsupport/actions/sauce@v1
  with: 
    sauceUsername: "${{ vars.SAUCE_USERNAME }}"
    sauceAccessKey: "${{ secrets.SAUCE_ACCESS_KEY }}"
    sauceTunnelName: "nes_nuxt2_tunnel"
    prerunScript: npm run dev
```

## Snyk

### Inputs
  `snykToken` - The snyk token used to access snyk cloud and/or run scan. Required.
  `snykThreshold` - The snyk threshold to fail on. Optional (default: `medium`)

### Usage
```
- name: Snyk
  uses: neverendingsupport/actions/snyk@v1
  with:
    snykToken: ${{ secrets.SNYK_TOKEN }}
```

## Sonar

### Inputs
  `sonarToken` - The sonar token used to access sonar cloud and/or run scan. Required.

### Usage
```
- name: SonarCloud Scan
  uses: neverendingsupport/actions/sonar@v1
  with:
    sonarToken: ${{ secrets.SONAR_TOKEN }}
```