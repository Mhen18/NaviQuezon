///{@template VerificationSortEnum}
/// Enum class for the verification sort.
///{@endtemplate}
enum VerificationSortEnum {
  none(null),
  name('name'),
  email('email'),
  createdDate('created_at'),
  updatedDate('updated_at');

  const VerificationSortEnum(this.value);

  final String? value;
}
