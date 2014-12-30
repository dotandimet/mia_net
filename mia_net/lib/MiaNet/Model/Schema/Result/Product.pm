use utf8;
package MiaNet::Model::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<products>

=cut

__PACKAGE__->table("products");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 product_number

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=head2 name

  data_type: 'varchar2'
  is_nullable: 0
  size: 600

=head2 manufacturer

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=head2 supplier

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=head2 is_stock

  data_type: 'boolean'
  is_nullable: 1

=head2 concentration

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_number",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
  "name",
  { data_type => "varchar2", is_nullable => 0, size => 600 },
  "manufacturer",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
  "supplier",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
  "is_stock",
  { data_type => "boolean", is_nullable => 1 },
  "concentration",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<product_number_unique>

=over 4

=item * L</product_number>

=back

=cut

__PACKAGE__->add_unique_constraint("product_number_unique", ["product_number"]);

=head1 RELATIONS

=head2 ingredients

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Ingredient>

=cut

__PACKAGE__->has_many(
  "ingredients",
  "MiaNet::Model::Schema::Result::Ingredient",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 materials

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Material>

=cut

__PACKAGE__->has_many(
  "materials",
  "MiaNet::Model::Schema::Result::Material",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nE6dd0yI6UzXMObt3QLJiA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
