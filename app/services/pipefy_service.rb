module PipefyService
  class << self
    attr_accessor :response

    def find_organization
      query = get_organization_query

      @response = client_rest(query)

      if success?
        return JSON.parse(@response)['data']
      end

      return { 'error' => "Não foi posssivel buscar os dados." }
    end

    private

    def get_organization_query
      query = '{ "query": "{ organization (id: 92858) { id name pipes { id name phases { fields { label } cards { edges { node { id title created_at current_phase { name } due_date fields { name value } } } } } } } }" }'
    end

    def client_rest(values)
      headers = {
        :content_type => 'application/json',
        :authorization => "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjp7ImlkIjo2NjE0MCwiZW1haWwiOiJwaXBlZnlkZXZyZWNydWl0aW5nZmFrZXVzZXJAbWFpbGluYXRvci5jb20iLCJhcHBsaWNhdGlvbiI6NDUzOH19.uUX4KIR4m_K-8NwLYhtVpsNnLEoLARebIQiyQDxEm3RZLHCffLrcH-V8RmuJLu8nqE8AQ-SvqUvgz3fe0UyZ4w"
      }

      response = RestClient.post 'https://app.pipefy.com/queries', values, headers
    end

    def success?
      JSON.parse(@response).has_key?("data")
    end
  end
end