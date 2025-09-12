data "aws_ce_tags" "this" {
  time_period {
    start = var.time_period.start
    end   = var.time_period.end
  }

  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {
      dynamic "and" {
        for_each = filter.value.and != null ? filter.value.and : []
        content {
          dynamic "cost_category" {
            for_each = and.value.cost_category != null ? [and.value.cost_category] : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = and.value.dimension != null ? [and.value.dimension] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

        }
      }

      dynamic "cost_category" {
        for_each = filter.value.cost_category != null ? [filter.value.cost_category] : []
        content {
          key           = cost_category.value.key
          match_options = cost_category.value.match_options
          values        = cost_category.value.values
        }
      }

      dynamic "dimension" {
        for_each = filter.value.dimension != null ? [filter.value.dimension] : []
        content {
          key           = dimension.value.key
          match_options = dimension.value.match_options
          values        = dimension.value.values
        }
      }

      dynamic "not" {
        for_each = filter.value.not != null ? [filter.value.not] : []
        content {
          dynamic "cost_category" {
            for_each = not.value.cost_category != null ? [not.value.cost_category] : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = not.value.dimension != null ? [not.value.dimension] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

        }
      }

      dynamic "or" {
        for_each = filter.value.or != null ? filter.value.or : []
        content {
          dynamic "cost_category" {
            for_each = or.value.cost_category != null ? [or.value.cost_category] : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = or.value.dimension != null ? [or.value.dimension] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

        }
      }

    }
  }

  search_string = var.search_string

  dynamic "sort_by" {
    for_each = var.sort_by != null ? [var.sort_by] : []
    content {
      key        = sort_by.value.key
      sort_order = sort_by.value.sort_order
    }
  }

  tag_key = var.tag_key
}