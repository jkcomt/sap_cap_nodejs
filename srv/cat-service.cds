using my.bookshop as my from '../db/data-model';

service CatalogService @(requires: 'authenticated-user'){
  @requires: 'viewer'
  entity Books @readonly as projection on my.Books;  
  entity Authors @readonly as projection on my.Authors;
  @odata.draft.enabled :true
  entity Orders 
  @(restrict:[{ grant:'*', to:'admin'}])
  @insertonly as projection on my.Orders;
}