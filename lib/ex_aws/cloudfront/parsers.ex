if Code.ensure_loaded?(SweetXml) do
  defmodule ExAws.Cloudfront.Parsers do
    use ExAws.Operation.Query.Parser
    import SweetXml, only: [sigil_x: 2, transform_by: 2]

    def parse({:ok, resp}, :list_distributions) do
      resp
      |> parse_xml(
        ~x"//DistributionList",
        items: [
          ~x"./Items/DistributionSummary"l,
          aliases: [
            ~x"./Aliases"o,
            items: [
              ~x"./Items/CNAME/text()"l
            ],
            quantity: ~x"./Quantity/text()"i
          ],
          alias_icp_recordals: [
            ~x"./AliasICPRecordals"o,
            cname: ~x"./AliasICPRecordal/CNAME/text()"s,
            icp_recordal_status: ~x"./AliasICPRecordal/ICPRecordalStatus/text()"s
          ],
          arn: ~x"./ARN/text()"s,
          cache_behaviors: [
            ~x"./CacheBehaviors"o,
            items: [
              ~x"./Items/CacheBehavior"l,
              allowed_methods: [
                ~x"./AllowedMethods"o,
                cached_methods: [
                  ~x"./CachedMethods"o,
                  items: [
                    ~x"./Items/Method/text()"l
                  ],
                  quantity: ~x"./Quantity/text()"i
                ],
                items: [
                  ~x"./Items/Method/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              cache_policy_id: ~x"./CachePolicyId/text()"s,
              compress: ~x"./Compress/text()"s |> to_boolean,
              default_ttl: ~x"./DefaultTTL/text()"i,
              field_level_encyrption_id: ~x"./FieldLevelEncryptionId/text()"s,
              forwarded_values: [
                ~x"./ForwardedValues"o,
                cookies: [
                  ~x"./Cookies"o,
                  forward: ~x"./Forward/text()"s,
                  whitelisted_names: [
                    ~x"./WhitelistedNames"o,
                    items: [
                      ~x"./Items/Name/text()"l
                    ],
                    quantity: ~x"./Quantity/text()"i
                  ]
                ],
                headers: [
                  ~x"./Headers"o,
                  items: [
                    ~x"./Items/Name/text()"l
                  ],
                  quantity: ~x"./Quantity/text()"i
                ],
                query_string: ~x"./QueryString/text()"s |> to_boolean,
                query_string_cache_keys: [
                  ~x"./QueryStringCacheKeys"o,
                  items: [
                    ~x"./Items/Name/text()"l
                  ],
                  quantity: ~x"./Quantity/text()"i
                ]
              ],
              function_associations: [
                ~x"./FunctionAssociations"o,
                items: [
                  ~x"./Items/FunctionAssociation"l,
                  event_type: ~x"./EventType/text()"s,
                  function_arn: ~x"./FunctionArn/text()"s
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              lambda_function_associations: [
                ~x"./LambdaFunctionAssociations"o,
                quantity: ~x"./Quantity/text()"i,
                items: [
                  ~x"./Items/LambdaFunctionAssociation"l,
                  event_type: ~x"./EventType/text()"s,
                  include_body: ~x"./IncludeBody/text()"s |> to_boolean,
                  lambda_function_arn: ~x"./LambdaFunctionARN/text()"s
                ]
              ],
              max_ttl: ~x"./MaxTTL/text()"i,
              min_ttl: ~x"./MinTTL/text()"i,
              origin_request_policy_id: ~x"./OriginRequestPolicyId/text()"s,
              path_pattern: ~x"./PathPattern/text()"s,
              realtime_log_config_arn: ~x"./RealtimeLogConfigArn/text()"s,
              response_headers_policy_id: ~x"./ResponseHeadersPolicyId/text()"s,
              smooth_streaming: ~x"./SmoothStreaming/text()"s |> to_boolean,
              target_origin_id: ~x"./TargetOriginId/text()"s,
              trusted_key_groups: [
                ~x"./TrustedKeyGroups"o,
                enabled: ~x"./Enabled/text()"s |> to_boolean,
                items: [
                  ~x"./Items/KeyGroup/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              trusted_signers: [
                ~x"./TrustedSigners"o,
                enabled: ~x"./Enabled/text()"s |> to_boolean,
                items: [
                  ~x"./Items/AwsAccountNumber/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              viewer_protocol_policy: ~x"./ViewerProtocolPolicy/text()"s
            ],
            quantity: ~x"./Quantity/text()"i
          ],
          comment: ~x"./Comment/text()"s,
          custom_error_responses: [
            ~x"./CustomErrorResponses"o,
            items: [
              ~x"./Items/CustomErrorResponse"l,
              error_caching_min_ttl: ~x"./ErrorCachingMinTTL/text()"i,
              error_code: ~x"./ErrorCode/text()"i,
              response_code: ~x"./ResponseCode/text()"s,
              response_page_path: ~x"./ResponsePagePath/text()"s
            ],
            quantity: ~x"./Quantity/text()"i
          ],
          default_cache_behavior: [
            ~x"./DefaultCacheBehavior"o,
            allowed_methods: [
              ~x"./AllowedMethods"o,
              cached_methods: [
                ~x"./CachedMethods"o,
                items: [
                  ~x"./Items/Method/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              items: [
                ~x"./Items/Method/text()"l
              ],
              quantity: ~x"./Quantity/text()"i
            ],
            cache_policy_id: ~x"./CachePolicyId/text()"s,
            compress: ~x"./Compress/text()"s |> to_boolean,
            default_ttl: ~x"./DefaultTTL/text()"i,
            field_level_encryption_id: ~x"./FieldLevelEncryptionId/text()"s,
            forwarded_values: [
              ~x"./ForwardedValues"o,
              cookies: [
                ~x"./Cookies"o,
                forward: ~x"./Forward/text()"s,
                whitelisted_names: [
                  ~x"./WhitelistedNames"o,
                  items: [
                    ~x"./Items/Name/text()"l
                  ],
                  quantity: ~x"./Quantity/text()"i
                ]
              ],
              headers: [
                ~x"./Headers"o,
                items: [
                  ~x"./Items/Name/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              query_string: ~x"./QueryString/text()"s |> to_boolean,
              query_string_cache_keys: [
                ~x"./QueryStringCacheKeys"o,
                items: [
                  ~x"./Items/Name/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ]
            ],
            function_associations: [
              ~x"./FunctionAssociations"o,
              items: [
                ~x"./Items/FunctionAssociation"l,
                event_type: ~x"./EventType/text()"s,
                function_arn: ~x"./FunctionARN/text()"s
              ],
              quantity: ~x"./Quantity/text()"i
            ],
            lambda_function_associations: [
              ~x"./LambdaFunctionAssociations"o,
              items: [
                ~x"./Items/LambdaFunctionAssociation"l,
                event_type: ~x"./EventType/text()"s,
                include_body: ~x"./IncludeBody/text()"s |> to_boolean,
                lambda_function_arn: ~x"./LambdaFunctionARN/text()"s
              ],
              quantity: ~x"./Quantity/text()"i
            ],
            max_ttl: ~x"./MaxTTL/text()"i,
            min_ttl: ~x"./MinTTL/text()"i,
            origin_request_policy_id: ~x"./OriginRequestPolicyId/text()"s,
            realtime_log_config_arn: ~x"./RealtimeLogConfigArn/text()"s,
            response_headers_policy_id: ~x"./ResponseHeadersPolicyId/text()"s,
            smooth_streaming: ~x"./SmoothStreaming/text()"s |> to_boolean,
            target_origin_id: ~x"./TargetOriginId/text()"s,
            trusted_key_groups: [
              ~x"./TrustedKeyGroups"o,
              enabled: ~x"./Enabled/text()"s |> to_boolean,
              items: [
                ~x"./Items/KeyGroup/text()"l
              ],
              quantity: ~x"./Quantity/text()"i
            ],
            trusted_signers: [
              ~x"./TrustedSigners"o,
              enabled: ~x"./Enabled/text()"s |> to_boolean,
              items: [
                ~x"./Items/AwsAccountNumber/text()"l
              ],
              quantity: ~x"./Quantity/text()"i
            ],
            viewer_protocol_policy: ~x"./ViewerProtocolPolicy/text()"s
          ],
          domain_name: ~x"./DomainName/text()"s,
          enabled: ~x"./Enabled/text()"s |> to_boolean,
          http_version: ~x"./HttpVersion/text()"s,
          id: ~x"./Id/text()"s,
          is_ipv6_enabled: ~x"./IsIPV6Enabled/text()"s |> to_boolean,
          last_modified_time: ~x"./LastModifiedTime/text()"s,
          origin_groups: [
            ~x"./OriginGroups"o,
            items: [
              ~x"./Items/OriginGroup"l,
              failover_criteria: [
                ~x"./FailoverCriteria"o,
                status_codes: [
                  ~x"./StatusCodes"o,
                  items: [
                    ~x"./Items/StatusCode/text()"l
                  ],
                  quantity: ~x"./Quantity/text()"i
                ]
              ],
              id: ~x"./Id/text()"s,
              members: [
                ~x"./Members"o,
                items: [
                  ~x"./Items/OriginGroupMember/OriginId/text()"l
                ],
                quantity: ~x"./Quantity/text()"i
              ]
            ],
            quantity: ~x"./Quantity/text()"i
          ],
          origins: [
            ~x"./Origins"o,
            items: [
              ~x"./Items/Origin"l,
              connection_attempts: ~x"./ConnectionAttempts/text()"i,
              connection_timeout: ~x"./ConnectionTimeout/text()"i,
              custom_headers: [
                ~x"./CustomHeaders"o,
                items: [
                  ~x"./Items/OriginCustomHeader"o,
                  header_name: ~x"./HeaderName/text()"s,
                  header_value: ~x"./HeaderValue/text()"s
                ],
                quantity: ~x"./Quantity/text()"i
              ],
              custom_origin_config: [
                ~x"./CustomOriginConfig"o,
                http_port: ~x"./HTTPPort/text()"i,
                https_port: ~x"./HTTPSPort/text()"i,
                origin_keepalive_timeout: ~x"./OriginKeepaliveTimeout/text()"i,
                origin_protocol_policy: ~x"./OriginProtocolPolicy/text()"s,
                origin_read_timeout: ~x"./OriginReadTimeout/text()"i,
                origin_ssl_protocols: [
                  ~x"./OriginSslProtocols"o,
                  items: [
                    ~x"./Items/SslProtocol/text()"l
                  ],
                  quantity: ~x"./Quantity/text()"i
                ]
              ],
              domain_name: ~x"./DomainName/text()"s,
              id: ~x"./Id/text()"s,
              origin_path: ~x"./OriginPath/text()"s,
              origin_shield: [
                ~x"./OriginShield"o,
                enabled: ~x"./Enabled/text()"s |> to_boolean,
                origin_shield_region: ~x"./OriginShieldRegion/text()"s
              ],
              s3_origin_config: [
                ~x"./S3OriginConfig"o,
                origin_access_identity: ~x"./OriginAccessIdentity/text()"s
              ]
            ],
            quantity: ~x"./Quantity/text()"i
          ],
          price_class: ~x"./PriceClass/text()"s,
          restrictions: [
            ~x"./Restrictions"o,
            geo_restriction: [
              ~x"./GeoRestriction"o,
              items: [
                ~x"./Items/Location/text()"l
              ],
              quantity: ~x"./Quantity/text()"i,
              restriction_type: ~x"./RestrictionType/text()"s
            ]
          ],
          status: ~x"./Status/text()"s,
          viewer_certificate: [
            ~x"./ViewerCertificate"o,
            acm_certificate_arn: ~x"./ACMCertificateArn/text()"s,
            certificate: ~x"./Certificate/text()"s,
            certificate_source: ~x"./CertificateSource/text()"s,
            cloud_front_default_certificate: ~x"./CloudFrontDefaultCertificate/text()"s |> to_boolean,
            iam_certificate_id: ~x"./IAMCertificateId/text()"s,
            minimum_protocol_version: ~x"./MinimumProtocolVersion/text()"s,
            ssl_support_method: ~x"./SSLSupportMethod/text()"s
          ],
          web_acl_id: ~x"./WebACLId/text()"s
        ],
        is_truncated: ~x"./IsTruncated/text()"s |> to_boolean,
        marker: ~x"./Marker/text()"s,
        max_items: ~x"./MaxItems/text()"s,
        next_marker: ~x"./NextMarker/text()"so,
        quantity: ~x"./Quantity/text()"i
      )
    end

    defp to_boolean(xpath) do
      xpath |> transform_by(&(&1 == "true"))
    end

    defp parse_xml(%{body: xml} = resp, xpath, elements) do
      parsed_body = xml |> SweetXml.xpath(xpath, elements)
     {:ok, Map.put(resp, :body, parsed_body)}
    end
  end
end
