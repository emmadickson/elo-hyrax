module CurationConcern::Work
  extend ActiveSupport::Concern
  include ::CurationConcern::Curatable
  include ::CurationConcern::WithGenericFiles
  include Hydra::AccessControls::Embargoable
  include ::CurationConcern::WithEditors
  include CurationConcern::WithLinkedResources

  # Modules in Curate's CurationConcern::Work that we _might_ pull in later
  # include Curate::ActiveModelAdaptor
  # include CurationConcern::WithLinkedContributors
  # include CurationConcern::WithRelatedWorks

  included do
    has_metadata "properties", type: Worthwhile::PropertiesDatastream
  end

  def to_solr(solr_doc={}, opts={})
    super(solr_doc).tap do |solr_doc|
      Solrizer.set_field(solr_doc, 'generic_type', 'Work', :facetable)
    end
  end
end
