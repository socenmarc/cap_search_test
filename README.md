# Getting Started
 
This project has been developed to test the @cds.search annotation.
CAP docs about @cds.search usage here https://cap.cloud.sap/docs/guides/providing-services#search, section Searching data.
Check current limitations here https://cap.cloud.sap/docs/releases/mar21#tailored-search-with-cdssearch.

## Setup and deploy

```bash
npm install
cds build
```

For local testing, create a new default-env.json file with your hana service credentials:  
```
{  
  "VCAP_SERVICES": {  
    "hana": [  
      {  
        "name": "cap_search_test-db",  
        "tags": [  
          "hana"  
        ],  
        "credentials": {  
          "certificate":   
          .....  
          "user": ...  
        }  
      }  
    ]  
  }  
}  
``` 

To deploy to BTP run the following commands:  
```bash
mbt build  
cf deploy ....  
```

## Scenario

Entity Books is annotated with @cds.search:  
```  
@cds.search : {title, descr: false, author.name }  
entity Books : managed {  
  key ID : Integer;  
  title  : localized String(111);  
  descr  : localized String(1111);  
  author : Association to Authors;  
  genre  : Association to Genres;  
  stock  : Integer;  
  price  : Decimal(9,2);  
  currency : Currency;  
}  
``` 
Run and open fiori preview for browse/Books.
Try out different searches by the Search field:
- by title -> works fine
- by descr -> doesn't work, because is searching and it doesnt because of descr: false
- by author's name -> as mentioned in the docs doesn't work (see current limitations link at top of this document).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
