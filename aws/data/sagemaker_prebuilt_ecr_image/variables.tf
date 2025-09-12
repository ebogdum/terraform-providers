variable "repository_name" {
  type        = string
  description = "Name of the repository, which is generally the algorithm or library."

  validation {
    condition = contains([
      "autogluon-inference", "autogluon-training", "blazingtext", "djl-inference",
      "factorization-machines", "forecasting-deepar", "huggingface-pytorch-inference",
      "huggingface-pytorch-inference-neuron", "huggingface-pytorch-inference-neuronx",
      "huggingface-pytorch-tgi-inference", "huggingface-pytorch-training",
      "huggingface-pytorch-training-neuronx", "huggingface-pytorch-trcomp-training",
      "huggingface-tensorflow-inference", "huggingface-tensorflow-training",
      "huggingface-tensorflow-trcomp-training", "image-classification",
      "image-classification-neo", "ipinsights", "kmeans", "knn", "lda", "linear-learner",
      "mxnet-inference", "mxnet-inference-eia", "mxnet-training", "ntm", "object-detection",
      "object2vec", "pca", "pytorch-inference", "pytorch-inference-eia",
      "pytorch-inference-graviton", "pytorch-inference-neuronx", "pytorch-training",
      "pytorch-training-neuronx", "pytorch-trcomp-training", "randomcutforest",
      "sagemaker-base-python", "sagemaker-chainer", "sagemaker-clarify-processing",
      "sagemaker-data-wrangler-container", "sagemaker-debugger-rules",
      "sagemaker-geospatial-v1-0", "sagemaker-inference-mxnet",
      "sagemaker-inference-pytorch", "sagemaker-inference-tensorflow",
      "sagemaker-model-monitor-analyzer", "sagemaker-mxnet", "sagemaker-mxnet-eia",
      "sagemaker-mxnet-serving", "sagemaker-mxnet-serving-eia", "sagemaker-neo-mxnet",
      "sagemaker-neo-pytorch", "sagemaker-neo-tensorflow", "sagemaker-pytorch",
      "sagemaker-rl-coach-container", "sagemaker-rl-mxnet", "sagemaker-rl-ray-container",
      "sagemaker-rl-tensorflow", "sagemaker-rl-vw-container", "sagemaker-scikit-learn",
      "sagemaker-spark-processing", "sagemaker-sparkml-serving", "sagemaker-tensorflow",
      "sagemaker-tensorflow-eia", "sagemaker-tensorflow-scriptmode",
      "sagemaker-tensorflow-serving", "sagemaker-tensorflow-serving-eia",
      "sagemaker-tritonserver", "sagemaker-xgboost", "semantic-segmentation", "seq2seq",
      "stabilityai-pytorch-inference", "tei", "tei-cpu", "tensorflow-inference",
      "tensorflow-inference-eia", "tensorflow-inference-graviton", "tensorflow-training",
      "xgboost-neo"
    ], var.repository_name)
    error_message = "data_sagemaker_prebuilt_ecr_image, repository_name must be one of the supported repository names."
  }
}

variable "dns_suffix" {
  type        = string
  description = "DNS suffix to use in the registry path. If not specified, the AWS provider sets it to the DNS suffix for the current region."
  default     = null
}

variable "image_tag" {
  type        = string
  description = "Image tag for the Docker image. If not specified, the AWS provider sets the value to 1, which for many repositories indicates the latest version."
  default     = null
}

variable "region" {
  type        = string
  description = "Region to use in the registry path. Defaults to the Region set in the provider configuration."
  default     = null
}