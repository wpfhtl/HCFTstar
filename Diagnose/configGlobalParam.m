globalParam = struct(...
    'MotionModel',                  @ParticleFilterMotionModel, ...
    'FeatureExtractor',             @HogRawPixelNormExtractor, ...
    'ConfidenceJudger',             @ClassificationScoreJudger, ...
    'ObservationModelTrain',        @LogisticRegressionTrain, ...
    'ObservationModelTest',         @LogisticRegressionTest, ...
    'NegSampler',                   @NegSlidingWindowSampler, ...
    'PosSampler',                   @PosSlidingWindowSampler ... 
);