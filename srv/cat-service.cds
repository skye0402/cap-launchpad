using my.bookshop as my from '../db/data-model';

service CatalogService {
    @readonly entity Books as projection on my.Books;
}

annotate CatalogService with @(
    requires: 'authenticated-user'
);
    
annotate CatalogService.Books with @(
    restrict: [
        {
            grant: 'READ', to: 'Display', where: 'prodType = $user.prodType'
        }
    ],
    UI : { 
        SelectionFields  : [
            prodType
        ],
        LineItem  : [
            { Value : ID },
            { Value : prodType },
            { Value : title }, 
            { Value : stock }                                   
        ],
     }
){
    ID @( title: 'ID' ); 
    prodType @( title: 'Type of product');
    title @( title: 'Title' );
    stock @( title: 'Stock' );
};