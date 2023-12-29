import { LightningElement, api, wire } from 'lwc';
import { gql, graphql } from "lightning/uiGraphQLApi";

export default class ContentVersionImage extends LightningElement {

    @api contentVersionId = null;
    @api linkedEntityId;
    @api ContentDocumentTitleFilter;

    get url() {
        return '/sfc/servlet.shepherd/version/download/' + this.contentVersionId;
    }

    @wire(graphql, {
        query: gql`
          query getContentVersionId($linkedEntityId: ID, $contentDocumentTitleFilter: String) {
            uiapi {
              query {
                ContentDocumentLink(where: {
                    and: [
                        { LinkedEntityId: { eq: $linkedEntityId } },
                        { ContentDocument: { Title: { like : $contentDocumentTitleFilter } } }
                    ]
                }) {
                  edges {
                    node {
                      Id
                      ContentDocument {
                        Id
                        LatestPublishedVersionId {
                          value
                        }
                      }
                    }
                  }
                }
            }
          }
        }`,
        variables: "$graphVariables",
        operationName: "getContentVersionId"
      }) 
      graphqlQueryResult({ data, errors }) {
        if(this.contentVersionId === null) {
            if(data) {
                let edges = data.uiapi.query.ContentDocumentLink.edges;
                if(edges.length > 0) {
                    this.contentVersionId = edges[0].node.ContentDocument.LatestPublishedVersionId.value;
                }
                else {
                    this.contentVersionId = null;
                }

            console.log(data);

            }
            this.errors = errors;
        }
      }
    
      get graphVariables() {

        let out = {
            linkedEntityId: this.linkedEntityId,
            contentDocumentTitleFilter: this.ContentDocumentTitleFilter
        }

        return out;
        
      }

}