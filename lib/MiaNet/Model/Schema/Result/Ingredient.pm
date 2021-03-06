use utf8;
package MiaNet::Model::Schema::Result::Ingredient;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Ingredient

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ingredients>

=cut

__PACKAGE__->table("ingredients");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 step_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 quantity

  data_type: 'numeric'
  is_nullable: 0

=head2 units

  data_type: 'varchar2'
  is_foreign_key: 1
  is_nullable: 1
  size: 10

=head2 product_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "step_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "quantity",
  { data_type => "numeric", is_nullable => 0 },
  "units",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 1, size => 10 },
  "product_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 product

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "MiaNet::Model::Schema::Result::Product",
  { id => "product_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 protocol

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Protocol>

=cut

__PACKAGE__->belongs_to(
  "protocol",
  "MiaNet::Model::Schema::Result::Protocol",
  { id => "protocol_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 step

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Step>

=cut

__PACKAGE__->belongs_to(
  "step",
  "MiaNet::Model::Schema::Result::Step",
  { id => "step_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 unit

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Unit>

=cut

__PACKAGE__->belongs_to(
  "unit",
  "MiaNet::Model::Schema::Result::Unit",
  { name => "units" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oi+c0D60uxOi6ODPOTdm0Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
