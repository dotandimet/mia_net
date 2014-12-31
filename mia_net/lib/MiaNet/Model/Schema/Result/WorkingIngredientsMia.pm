use utf8;
package MiaNet::Model::Schema::Result::WorkingIngredientsMia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::WorkingIngredientsMia

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<working_ingredients_mia>

=cut

__PACKAGE__->table("working_ingredients_mia");

=head1 ACCESSORS

=head2 product_id

  data_type: (empty string)
  is_nullable: 1

=head2 quantity

  data_type: (empty string)
  is_nullable: 1

=head2 units

  data_type: (empty string)
  is_nullable: 1

=head2 protocol_id

  data_type: (empty string)
  is_nullable: 1

=head2 step_id

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "product_id",
  { data_type => "", is_nullable => 1 },
  "quantity",
  { data_type => "", is_nullable => 1 },
  "units",
  { data_type => "", is_nullable => 1 },
  "protocol_id",
  { data_type => "", is_nullable => 1 },
  "step_id",
  { data_type => "", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-31 03:05:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SoAXnffEkDDWQEBcog7kvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
